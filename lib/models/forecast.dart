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
      time: _formatTime(json['dt']),
      weatherIcon: json['weather'][0]['icon'],
      temperature: json['main']['temp'].toDouble(),
    );
  }

  static String _formatTime(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return '${dateTime.hour.toString().padLeft(2, '0')}:00'; // Fix formatting
  }
}
