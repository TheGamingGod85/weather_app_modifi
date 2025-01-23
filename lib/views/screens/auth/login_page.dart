// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/views/screens/main/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key
  final _formkey = GlobalKey<FormState>();
  var _isObsecured;

  @override
  void initState() {
    super.initState();
    _isObsecured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title : Weather App
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Weather ',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreenColor,
                          ),
                        ),
                        TextSpan(
                          text: 'App',
                          style: TextStyle(
                            fontSize: 36,
                            color: AppColors.darkGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 90),
        
                  // Input : Email
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.person, color: AppColors.darkGreenColor),
                      hintText: "Login",
                      hintStyle: TextStyle(color: AppColors.darkGreenColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.darkGreenColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.darkGreenColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
        
                  // Input : Password
                  TextFormField(
                    obscureText: _isObsecured,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.darkGreenColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObsecured ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.darkGreenColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObsecured = !_isObsecured;
                          });
                        },
                        color: AppColors.darkGreenColor,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: AppColors.darkGreenColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.darkGreenColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.darkGreenColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
        
                  // forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot password ?",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  SizedBox(height: 50),
        
                  // Button : Sign in
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement Sign in
        
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            // applied a SlideTransition effect
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    HomePage(),
                            transitionDuration: Duration(milliseconds: 800),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) =>
                                    SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(1, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkGreenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
        
                  // Text : Dont have a Account? 'Sign up'
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Color(0xFFB0B0B0),
                            ),
                          ),
                          TextSpan(
                            text: "Sign up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                            style: TextStyle(
                              color: AppColors.darkGreenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
