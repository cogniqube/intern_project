
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GradientButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDBB2D), // Light yellow/orange color
              Color(0xFFDD2E44), // Deep orange/red color
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 160, vertical: 15), backgroundColor: Colors.transparent, // Make button background transparent
            shadowColor: Colors.transparent, // Remove button shadow
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}