import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherProvider with ChangeNotifier {
  // WeatherModel instance
  WeatherModel? _weatherModel;

  // List of Forecast instances
  final List<Forecast> _forecast = [];

  // Loading indicator
  bool _isLoading = false;

  // Getters for the WeatherModel, forecast, and isLoading
  WeatherModel? get weatherModel => _weatherModel;
  List<Forecast> get forecast => _forecast;
  bool get isLoading => _isLoading;

  // ApiService instance
  final ApiService _apiService = ApiService();

  // Method to fetch weather data
  Future<void> fetchWeatherData(double lat, double lon) async {
    _isLoading = true;
    notifyListeners();

    // Notify listeners to update the UI
    await Future.delayed(Duration(seconds: 2));

    _weatherModel = await _apiService.getWeather(lat, lon);

    // Set isLoading to false
    _isLoading = false;

    // Notify listeners to update the UI
    notifyListeners();
  }
}
