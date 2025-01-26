import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/navigation_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/views/screens/main/location_page.dart';
import 'package:weather_app/views/screens/main/settings_page.dart';
import 'package:weather_app/views/widgets/home_page_widgets/additional_weather.dart';
import 'package:weather_app/views/widgets/home_page_widgets/date_day_widget.dart';
import 'package:weather_app/views/widgets/home_page_widgets/forecast_widget.dart';
import 'package:weather_app/views/widgets/home_page_widgets/icon_temp_widget.dart';
import 'package:weather_app/views/widgets/home_page_widgets/view_next_7_days_widget.dart';
import 'package:weather_app/views/widgets/home_page_widgets/weather_details_widget.dart';
import 'package:weather_app/services/location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocationService _locationService = LocationService();
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _getUserLocationWeather();
  }

  Future<void> _getUserLocationWeather() async {
    try {
      final position = await _locationService.getCurrentLocation();
      if (position != null) {
        Provider.of<WeatherProvider>(context, listen: false).fetchWeatherData(
          position.latitude,
          position.longitude,
        );
      }
    } catch (e) {
      print('Error getting Location : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
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
          weatherProvider.weatherModel?.locationName ?? 'Fetching Location...',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _getUserLocationWeather();
        },
        child: SafeArea(
          child: weatherProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Consumer<NavigationProvider>(
                      builder: (context, navigationProvider, child) {
                        final currentIndex = navigationProvider.currentIndex;
                        final screen = [
                          // home page
                          SingleChildScrollView(
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 25,
                              children: [
                                DateDayWidget(),
                                IconTempWidget(),
                                AdditionalWeather(),
                                WeatherDetailsWidget(),
                                ForecastWidget(),
                                ViewNext7DaysWidget(),
                              ],
                            ),
                          ),
                          const LocationPage(),
                          const SettingsPage(),
                        ];
                        return screen[currentIndex];
                      },
                    ),
                  ),
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
            tabActiveBorder: Border.all(
              color: AppColors.darkGreenColor,
              width: 2,
            ),

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
      ),
    );
  }
}
