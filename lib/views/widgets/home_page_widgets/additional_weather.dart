import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class AdditionalWeather extends StatelessWidget {
  const AdditionalWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // feels like
        Row(
          children: [
            // feels like

            Text(
              'Feels like ',
            ),
            Text(
              ' ${weatherProvider.weatherModel?.feelsLike}°',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.thermostat_outlined,
            ),
          ],
        ),

        // day max temp
        Row(
          children: [
            // day max temp
            Text(
              'Day ',
            ),
            Text(
              ' ${weatherProvider.weatherModel?.maxTemp}°',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // icon
            Icon(
              Icons.arrow_upward_rounded,
            ),
          ],
        ),

        // night min temp
        Row(
          children: [
            // night min temp
            Text(
              'Night ',
            ),

            Text(
              ' ${weatherProvider.weatherModel?.minTemp}°',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // icon
            Icon(
              Icons.arrow_downward_rounded,
            ),
          ],
        ),
      ],
    );
  }
}
