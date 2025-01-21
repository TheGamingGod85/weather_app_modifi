class Forecast {
  final String time;
  final String weatherIcon;
  final double temperature;

  Forecast({
    required this.time,
    required this.weatherIcon,
    required this.temperature,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      time: json['dt_txt'],
      weatherIcon: json['weather'][0]['icon'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
