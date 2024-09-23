import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SelfCertification.dart';
import 'package:intern_project/pages/Login/SignupEmail.dart'; 

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpPage()), // Replace with your LoginScreen widget
              );
            },
          ),
          title: Text('Signup'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'checking password',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SelfCertificationScreen()), // Replace with your LoginScreen widget
              );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}