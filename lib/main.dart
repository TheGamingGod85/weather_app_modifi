import 'package:weather_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/screens/auth/auth_wrapper.dart';
import 'package:weather_app/utils/colors/app_colors.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider())
      ], child: MainApp(),
      )
  );

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primaryColor,
        textTheme: TextTheme(),
      ),
      home: AuthWrapper(),
    );
  }
}
