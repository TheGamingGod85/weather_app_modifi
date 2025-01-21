import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_model.dart';

class ApiService {
  final String apiKey = 'd98619ef84410cd4c314b83a8bd8c431';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<WeatherModel> fetchWeather(String city) async {
    final baseURL =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<Forecast>> fetchForecast(String city) async {
    final response = await http.get(
        Uri.parse('$_baseUrl/forecast?q=$city&units=metric&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['list'] as List).map((e) => Forecast.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
