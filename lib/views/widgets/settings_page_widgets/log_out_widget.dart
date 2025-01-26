import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/auth_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/views/screens/auth/auth_wrapper.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      icon: const Icon(Icons.logout),
      iconColor: AppColors.darkGreenColor,
      title: const Text('Log Out'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.darkGreenColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).logout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthWrapper(),
              ),
            );
          },
          child: const Text(
            'Log Out',
            style: TextStyle(color: AppColors.darkGreenColor),
          ),
        ),
      ],
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Log Out',
        elevation: 3,
        backgroundColor: AppColors.darkGreenColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alertDialog;
            },
          );
        },
        child: const Icon(
          Icons.logout,
          color: Colors.black,
        ),
      ),
    );
  }
}
