import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_app/providers/auth_provider.dart';
import 'package:weather_app/screens/auth/signup_page.dart';
import 'package:weather_app/utils/colors/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _isObsecured = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Icon(Icons.cloud, size: 80, color: AppColors.accentColor),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Firebase Auth ',
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: 'Module',
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),

                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.surfaceColor,
                        prefixIcon:
                            Icon(Icons.email, color: AppColors.accentColor),
                        hintText: "Email Address",
                        hintStyle: TextStyle(color: AppColors.hintColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObsecured,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.surfaceColor,
                        prefixIcon:
                            Icon(Icons.lock, color: AppColors.accentColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObsecured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.accentColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObsecured = !_isObsecured;
                            });
                          },
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: AppColors.hintColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.hintColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Sign In Button
                    authProvider.isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                bool success = await authProvider.login(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                                if (!success && mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text(authProvider.errorMessage),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accentColor,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 24),

                    // Sign Up Text
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.poppins(
                              color: AppColors.hintColor,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: "Sign up",
                            style: GoogleFonts.poppins(
                              color: AppColors.accentColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignupPage()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
