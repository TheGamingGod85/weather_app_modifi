import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/screens/auth/login_page.dart';
import 'package:weather_app/screens/main/home_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user == null || !user.emailVerified) {
      return LoginPage();
    } else {
      return const HomePage();
    }
  }
}
