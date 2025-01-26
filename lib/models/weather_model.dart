class WeatherModel {
  final String locationName;
  final String country;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final int pressure;
  final String weatherIcon;
  final String feelsLike;
  final String maxTemp;
  final String minTemp;

  WeatherModel({
    required this.locationName,
    required this.country,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.weatherIcon,
    required this.feelsLike,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationName: json['name'] ?? 'Unknown Location',
      temperature: json['main']['temp'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      country: json['sys']['country'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      feelsLike: json['main']['feels_like'].toString(),
      maxTemp: json['main']['temp_max'].toString(),
      minTemp: json['main']['temp_min'].toString(),
      weatherIcon: json['weather'][0]['icon'] ?? '01d',
    );
  }
}
