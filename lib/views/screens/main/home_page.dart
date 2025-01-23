import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // drop box / search filed to select the City.
              TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    weatherProvider.fetchWeatherData(_cityController.text);
                  }
                },
                controller: _cityController,
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  hintText: 'Search for city',
                  prefixIconColor: Colors.teal,
                  hintStyle: TextStyle(
                    color: Colors.teal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.search),
                  iconColor: Colors.teal,
                ),
              ),

              // display loading indicator
              if (weatherProvider.isLoading) CircularProgressIndicator(),

              if (weatherProvider.weatherModel != null)
                // Day and Date
                Column(
                  children: [
                    Text(
                      weatherProvider.weatherModel!.city,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${weatherProvider.weatherModel!.temperature} °C',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Image.network(
                      'http://openweathermap.org/img/wn/${weatherProvider.weatherModel!.weatherIcon}@2x.png',
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Wind Speed: ${weatherProvider.weatherModel!.windSpeed} m/s',
                          ),
                          Text(
                            'Humidity: ${weatherProvider.weatherModel!.humidity}%',
                          ),
                          Text(
                            'Pressure: ${weatherProvider.weatherModel!.pressure} hPa',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: weatherProvider.forecast.length,
                          itemBuilder: (context, index) {
                            final forecast = weatherProvider.forecast[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(forecast.time),
                                  Image.network(
                                    'http://openweathermap.org/img/wn/${forecast.weatherIcon}.png',
                                  ),
                                  Text('${forecast.temperature}°C'),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      // NAV BAR
      bottomNavigationBar: GNav(
        // styling
        rippleColor: AppColors.greyColor,
        hoverColor: Colors.black45,
        gap: 12,
        haptic: true,
        activeColor: AppColors.darkGreenColor,
        tabActiveBorder: Border.all(color: AppColors.darkGreenColor, width: 2),

        // tabs here!
        tabs: [
          // weather icon
          GButton(
            active: true,
            iconColor: AppColors.whiteColor,
            icon: Icons.cloud_rounded,
            text: 'Home',
          ),

          // location icon
          GButton(
            icon: Icons.map_rounded,
            iconColor: AppColors.whiteColor,
            text: 'Location',
          ),

          // settings icon
          GButton(
            icon: Icons.settings,
            iconColor: AppColors.whiteColor,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
