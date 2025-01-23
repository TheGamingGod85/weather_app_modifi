import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherProvider with ChangeNotifier {
  // WeatherModel instance
  WeatherModel? _weatherModel;

  // List of Forecast instances
  List<Forecast> _forecast = [];

  // Loading indicator
  bool _isLoading = false;

  // Getters for the WeatherModel, forecast, and isLoading
  WeatherModel? get weatherModel => _weatherModel;
  List<Forecast> get forecast => _forecast;
  bool get isLoading => _isLoading;

  // ApiService instance
  final ApiService _apiService = ApiService();

  // Method to fetch weather data
  Future<void> fetchWeatherData(String city) async {
    _isLoading = true;
    notifyListeners();

    // Fetch weather data and forecast data
    try {
      _weatherModel = await _apiService.fetchWeather(city);
      _forecast = await _apiService.fetchForecast(city);
    } catch (e) {
      _weatherModel = null;
      _forecast = [];
    }

    // Set isLoading to false
    _isLoading = false;

    // Notify listeners to update the UI
    notifyListeners();

    // fetch weather using latitude and longitude
    Future<void> fetchWeatherByLocation(
        double latitude, double longitude) async {
      _isLoading = true;
      notifyListeners();
      _weatherModel =
          await _apiService.getWeatherByLocation(latitude, longitude);
      _isLoading = false;
      notifyListeners();
    }
  }
}
