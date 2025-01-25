import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/auth_provider.dart';
import 'package:weather_app/views/screens/auth/login_page.dart';
import 'package:weather_app/views/screens/main/home_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.user == null) {
      return LoginPage();
    } else {
      return const HomePage();
    }
  }
}
