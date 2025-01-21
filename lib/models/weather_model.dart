import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WeatherModel with ChangeNotifier{
  final String cityName;
  final double temperature;
  final String description;
  final String icon;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  // void save() {
  //   final box = Hive.box('weather');
  //   box.put('city', cityName);
  //   box.put('temperature', temperature);
  //   box.put('description', description);
  //   box.put('icon', icon);
  // }



  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
