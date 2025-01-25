import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherProvider with ChangeNotifier {
  List<Forecast> _forecastList = [];
  WeatherModel? _weatherModel;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters for the WeatherModel, forecast, and isLoading
  WeatherModel? get weatherModel => _weatherModel;
  List<Forecast> get forecastList => _forecastList;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // ApiService instance
  final ApiService _apiService = ApiService();

  // Method to fetch weather data
  Future<void> fetchWeatherData(double lat, double lon) async {
    
    _isLoading = true;
    notifyListeners();

    try {
      _weatherModel = await _apiService.getWeather(lat, lon);
    } catch (e) {
      _errorMessage = 'Error fetching weather data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    // Set isLoading to false
    _isLoading = false;

    // Notify listeners to update the UI
    notifyListeners();
  }

  Future<void> fetchWeatherForecast(double lat, double lon) async {
    _isLoading = true;
    notifyListeners();

    try {
      final apiKey = dotenv.env['API_KEY'];
      final url =
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> forecastData = data['list'];

        _forecastList = forecastData.map((item) {
          return Forecast.fromJson(item);
        }).toList();
      } else {
        throw Exception('Failed to load weather forecast');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
