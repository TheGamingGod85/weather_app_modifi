import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        if (weatherProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.6, color: AppColors.darkGreenColor),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.thermostat_rounded,
                    color: AppColors.lightGreenColor,
                  ),
                  const SizedBox(width: 10),
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
              Divider(height: 20, color: AppColors.greyColor),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weatherProvider.forecastList.length,
                  itemBuilder: (context, index) {
                    final forecast = weatherProvider.forecastList[index];
                    return Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            forecast.time,
                            style: TextStyle(
                                fontSize: 16, color: AppColors.whiteColor),
                          ),
                          const Divider(color: Colors.white),
                          Icon('${weatherProvider.weatherModel?.weatherIcon}'
                              as IconData?),
                          const Divider(
                            color: Colors.grey,
                            height: 4,
                          ),
                          Text(
                            "${forecast.temperature}°C",
                            style: const TextStyle(fontSize: 16),
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
      },
    );
  }
}
