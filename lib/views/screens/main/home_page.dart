import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/navigation_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/views/screens/main/location_page.dart';
import 'package:weather_app/views/screens/main/settings_page.dart';
import 'package:weather_app/views/widgets/home_page_widgets/date_day_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.location_on_outlined),
            onPressed: () {},
            color: Colors.white,
          ),
          title: Text(
            ' Indore, Madhya Pradesh',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // BODY
            child: Consumer<NavigationProvider>(
              builder: (context, navigationProvider, child) {
                final currentIndex = navigationProvider.currentIndex;
                final screen = [
                  // home page
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // date and day
                      DateDayWidget(),
                    ],
                  ),
                  const LocationPage(),
                  const SettingsPage(),
                ];
                return screen[currentIndex];
              },
            ),
          ),
        ),
        // NAV BAR
        bottomNavigationBar: Consumer<NavigationProvider>(
          builder: (context, navigationProvider, child) {
            return GNav(
              // styling
              rippleColor: AppColors.greyColor,
              hoverColor: Colors.black45,
              gap: 12,
              haptic: true,
              activeColor: AppColors.darkGreenColor,
              tabActiveBorder:
                  Border.all(color: AppColors.darkGreenColor, width: 2),

              // tabs here!
              tabs: [
                // weather icon
                GButton(
                  active: true,
                  iconColor: AppColors.whiteColor,
                  icon: Icons.cloud_rounded,
                  text: 'Home',
                  onPressed: () {
                    navigationProvider.setCurrentIndex(0);
                  },
                ),

                // location icon
                GButton(
                  icon: Icons.map_rounded,
                  iconColor: AppColors.whiteColor,
                  text: 'Location',
                  onPressed: () {
                    navigationProvider.setCurrentIndex(1);
                  },
                ),

                // settings icon
                GButton(
                  icon: Icons.settings,
                  iconColor: AppColors.whiteColor,
                  text: 'Settings',
                  onPressed: () {
                    navigationProvider.setCurrentIndex(2);
                  },
                ),
              ],
            );
          },
        ));
  }
}
