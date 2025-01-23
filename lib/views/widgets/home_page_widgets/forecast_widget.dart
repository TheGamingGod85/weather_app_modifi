import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key});

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
      child: Column(
        children: [
          // title
          Row(
            children: [
              // icon
              Icon(
                Icons.thermostat_rounded,
                color: AppColors.lightGreenColor,
              ),

              // some space
              SizedBox(width: 10),

              // title text
              Text(
                "Upcoming Forecast",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGreenColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
            color: AppColors.greyColor,
          ),
          // forecast list of through the day, horizontally
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // time
                      Text(
                        "12:00 PM",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      // icon
                      Icon(
                        Icons.wb_sunny,
                        color: AppColors.orangeColor,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 4,
                      ),
                      // temperature
                      Text(
                        "30°C",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
