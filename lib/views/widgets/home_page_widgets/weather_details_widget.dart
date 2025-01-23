import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
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
                ' 5 km/h',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[300],
                ),
              ),
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
                ' 50%',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),

          // Precipitation
          Row(
            children: [
              // icon
              Icon(
                Icons.umbrella,
                color: AppColors.lightGreenColor,
              ),

              // Precipitation
              Text(
                '10 %',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
