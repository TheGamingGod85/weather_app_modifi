import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.6,
          color: AppColors.darkGreenColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          weatherProvider.weatherModel == null
              ? CircularProgressIndicator()
              :
              // wind speed
              Row(
                  children: [
                    // icon
                    Icon(
                      Icons.air,
                      color: AppColors.lightGreenColor,
                    ),

                    // wind speed
                    Text(
                      ' ${weatherProvider.weatherModel?.windSpeed} ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                    Text('km/h'),
                  ],
                ),

          // humidity
          Row(
            children: [
              // icon
              Icon(
                Icons.water_drop_outlined,
                color: AppColors.lightGreenColor,
              ),

              // humidity
              Text(
                ' ${weatherProvider.weatherModel?.humidity} ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
              Text('%'),
            ],
          ),

          // Pressure
          Row(
            children: [
              // icon
              Icon(
                Icons.water_rounded,
                color: AppColors.lightGreenColor,
              ),

              // Pressure
              Text(
                ' ${weatherProvider.weatherModel?.pressure} ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
              Text('hPa'),
            ],
          ),
        ],
      ),
    );
  }
}
