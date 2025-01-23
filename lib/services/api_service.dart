import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final apiKey = dotenv.env['API_KEY'];

  Future<WeatherModel> fetchWeather(String city) async {
    // loading the API key from the .env file
    await dotenv.load(fileName: '.env');

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
    final baseURL =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http
        .get(Uri.parse('$baseURL/forecast?q=$city&units=metric&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['list'] as List).map((e) => Forecast.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  // Fetch weather by latitude and longitude
  Future<WeatherModel?> getWeatherByLocation(double lat, double lon) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
