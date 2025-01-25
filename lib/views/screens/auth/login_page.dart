import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/auth_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/views/screens/auth/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key
  final _formkey = GlobalKey<FormState>();
  var _isObsecured;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isObsecured = true;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    controller: _emailController,
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.person, color: AppColors.darkGreenColor),
                      hintText: "Email",
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
                    controller: _passwordController,
                    key: ValueKey('password'),
                    obscureText: _isObsecured,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.darkGreenColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObsecured
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                  authProvider.isLoading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              bool success = await authProvider.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                              if (!success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(authProvider.errorMessage),
                                  ),
                                );
                              }
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
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
