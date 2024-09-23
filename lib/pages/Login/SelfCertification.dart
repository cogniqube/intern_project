import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/profile_page.dart'; 

class SelfCertificationScreen extends StatefulWidget {
  const SelfCertificationScreen({Key? key}) : super(key: key);

  @override
  _SelfCertificationScreenState createState() =>
      _SelfCertificationScreenState();
}

class _SelfCertificationScreenState extends State<SelfCertificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _authNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Self-certification'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Cell phone number'),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Enter your cell phonne number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement phone number verification logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Request Authentication'),
              ),
              const SizedBox(height: 16.0),
              const Text('Enter the authentication number'),
              TextFormField(
                controller: _authNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter the authentication number you received by text',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the authentication number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Implement certification logic
                    Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfilePage(title: "Profile")), // Replace with your LoginScreen widget
              );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Certified'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
