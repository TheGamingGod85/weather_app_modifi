import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'd98619ef84410cd4c314b83a8bd8c431';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    
    if(response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
