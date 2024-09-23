import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SignupPassword.dart'; 

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'ID',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process signup
                    String email = _emailController.text;
                    // TODO: Implement your signup logic using the email
                    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Password()),
      );
                    
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Set the button color
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
                ),
                child: const Text('Next',
                    style: TextStyle(color: Colors.white)), // Set text color
              ),
            ],
          ),
        ),
      ),
    );
  }
}