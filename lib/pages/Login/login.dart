import 'package:flutter/material.dart';
import 'package:intern_project/main.dart';
import 'package:intern_project/pages/Login/SignupEmail.dart';
import 'package:intern_project/pages/main_page.dart';
import 'package:intern_project/pages/profile/terms.dart';
import 'package:intern_project/styles/gradient_button.dart'; 
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // App Logo
              Image.asset(
                'assets/profile/logo.png', // Replace with your actual logo asset path
                height: 100,
              ),
              const SizedBox(height: 20),

              // App Title (in Korean)
              
              const SizedBox(height: 20),

              // Email Input Field
              const TextField(
                decoration: InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(color: Colors.orange),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password Input Field
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                  labelStyle: TextStyle(color: Colors.orange),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Replace ElevatedButton with GradientButton
              GradientButton(
                text: 'Log In',
                onPressed: () {
                  // Handle login logic
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
              const SizedBox(height: 10),

              // Forgot ID/Password Text
              TextButton(
                onPressed: () {
                  // Handle forgot password logic
                },
                child: const Text(
                  'Forgot ID/Password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),

              // Social Media Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSocialMediaButton('assets/profile/1.png'), // Kakao
                  const SizedBox(width: 10),
                  _buildSocialMediaButton('assets/profile/2.png'), // Naver
                  const SizedBox(width: 10),
                  _buildSocialMediaButton('assets/profile/3.png'), // Google
                  const SizedBox(width: 10),
                  _buildSocialMediaButton('assets/profile/4.png'), // Apple
                ],
              ),
              const SizedBox(height: 20),

              // General Membership Registration Text
              TextButton(
                onPressed: () {
                  // Handle registration logic
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                  );
                },
                child: const Text(
                  'Do you need general membership registration?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build social media buttons
  Widget _buildSocialMediaButton(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Handle social media login
      },
      child: Image.asset(
        assetPath,
        width: 50, // Adjust size accordingly
        height: 50, // Adjust size accordingly
      ),
    );
  }
}
