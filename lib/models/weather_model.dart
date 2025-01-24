class WeatherModel {
  final String locationName;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final int pressure;
  final String weatherIcon;

  WeatherModel({
    required this.locationName,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.weatherIcon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationName: json['name'] ?? 'Unknown Location',
      temperature: json['main']['temp'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}
