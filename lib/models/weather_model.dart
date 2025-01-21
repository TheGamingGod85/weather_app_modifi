import 'package:weather_app/models/forecast.dart';

class WeatherModel {
  final String city;
  final double temperature;
  final String weatherCondition;
  final double windSpeed;
  final int humidity;
  final int pressure;
  final String weatherIcon;
  final List<Forecast> forecast;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.weatherCondition,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.weatherIcon,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final List<Forecast> forecast =
        (json['daily'] as List).map((item) => Forecast.fromJson(item)).toList();

    return WeatherModel(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherCondition: json['weather'][0]['main'],
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      weatherIcon: json['weather'][0]['icon'],
      forecast: forecast,
    );
  }
}
