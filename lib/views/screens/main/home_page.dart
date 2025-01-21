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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // drop box / search filed to select the City.
            TextField(
              onTap: () {
                weatherProvider.fetchWeatherData(_cityController.text);
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
                  '${weatherProvider.weatherModel!.temperature}',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            // Weather Icon , Temp

            // box : wind speed, humidity, pressure

            // box : Weather Forecast of the day

            // button : View next 7 Days
          ],
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
