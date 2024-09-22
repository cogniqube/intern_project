import 'package:flutter/material.dart';
import 'package:intern_project/pages/feed_page.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/main');
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
