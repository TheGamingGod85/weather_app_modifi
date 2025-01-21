import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weatherModel;
  List<Forecast> _forecast = [];
  bool _isLoading = false;

  WeatherModel?get weatherModel => _weatherModel;
  List<Forecast> get forecast => _forecast;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchWeatherData(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      _weatherModel = await _apiService.fetchWeather(city);
      _forecast = await _apiService.fetchForecast(city);
    } catch (e) {
      _weatherModel = null;
      _forecast = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
