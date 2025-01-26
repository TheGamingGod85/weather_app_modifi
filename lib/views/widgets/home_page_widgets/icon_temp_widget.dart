import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class IconTempWidget extends StatelessWidget {
  const IconTempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // temp
        // icon
        Image.network(
          'https://openweathermap.org/img/wn/${weatherProvider.weatherModel?.weatherIcon}@2x.png',
          width: 120,
          height: 120,
          scale: 0.3,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.error,
              color: Colors.white,
            );
          },
        ),

        // wait 2 sec for the weather data to load
        weatherProvider.weatherModel == null
            ? CircularProgressIndicator(
                color: Colors.yellow,
              )
            : Text(
                '${weatherProvider.weatherModel?.temperature.toString()} °C',
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                ),
              ),
      ],
    );
  }
}
