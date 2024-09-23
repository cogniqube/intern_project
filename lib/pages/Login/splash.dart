import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/permission.dart'; 
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   @override
  void initState() {
    super.initState();
    
    // Timer to navigate after 4 seconds
    Timer(const Duration(seconds: 4), () {
      // Navigate to HomeScreen (or your next screen)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AppAccessPermissionGuide() ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo.png',  // Make sure to add your logo image in the assets folder
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}