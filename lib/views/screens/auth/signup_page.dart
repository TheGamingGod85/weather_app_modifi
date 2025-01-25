import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/auth_provider.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var isObsecured;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    isObsecured = true;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create a new \nAccount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // space
              const SizedBox(
                height: 20,
              ),

              const Text(
                'Please fill in the form below to create a new account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              // space
              const SizedBox(
                height: 40,
              ),

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

              // space
              const SizedBox(
                height: 20,
              ),

              // Input : Password
              TextFormField(
                controller: _passwordController,
                key: ValueKey('password'),
                obscureText: isObsecured,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.darkGreenColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObsecured ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.darkGreenColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isObsecured = !isObsecured;
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

              // space
              const SizedBox(
                height: 20,
              ),

              // Input : Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                key: ValueKey('confirmPassword'),
                obscureText: isObsecured,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.darkGreenColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObsecured ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.darkGreenColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isObsecured = !isObsecured;
                      });
                    },
                    color: AppColors.darkGreenColor,
                  ),
                  hintText: "Confirm Password",
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
              // space
              const SizedBox(
                height: 40,
              ),

              authProvider.isLoading
                  ? CircularProgressIndicator()
                  :
                  // Button : Sign up
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Password does not match"),
                              ),
                            );
                            return;
                          }

                          bool success = await authProvider.signUp(
                            _emailController.text,
                            _passwordController.text,
                          );

                          if (success) {
                            Navigator.pop(context);
                          } else {
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
                          "Sign up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
