import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/auth_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Log Out',
        elevation: 3,
        backgroundColor: AppColors.darkGreenColor,
        onPressed: () {
          Provider.of<AuthProvider>(context, listen: false).logout();
        },
        child: const Icon(
          Icons.logout,
          color: Colors.black,
        ),
      ),
    );
  }
}
