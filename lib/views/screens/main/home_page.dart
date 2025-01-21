import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // drop box / search filed to select the City.

            // Day and Date

            // Weather Icon , Temp

            // box : wind speed, humidity, pressure

            // box : Weather Forecast of the day

            // button : View next 7 Days

            // NAV BAR
          ],
        ),
      ),
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
