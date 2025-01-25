import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final apiKey = dotenv.env['API_KEY'];

  Future<WeatherModel> getWeather(double lat, double lon) async {
    // loading the API key from the .env file
    await dotenv.load(fileName: '.env');

    final baseURL =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(baseURL));

    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data $e');
    }
  }

  // get the forecast data
  Future<List<Forecast>> getForecast(double lat, double lon) async {
    // loading the API key from the .env file
    await dotenv.load(fileName: '.env');
    final apiKey = dotenv.env['API_KEY'];

    final forecastUrl =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(forecastUrl));

    // check if the response is successful
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List<dynamic> forecastList = data['list'];

      // convert each forecast JSON into a forecast model
      return forecastList.map((item) => Forecast.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
