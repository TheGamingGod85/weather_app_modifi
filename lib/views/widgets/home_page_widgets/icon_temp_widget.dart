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

        // icon
        // weatherProvider.weatherModel == null
        //     ? CircularProgressIndicator(
        //         color: Colors.yellow,
        //       )
        //     : Image.network(
        //         weatherProvider.weatherModel?.weatherIcon ?? '0',
        //         scale: 0.5,
        //       ),
      ],
    );
  }
}
