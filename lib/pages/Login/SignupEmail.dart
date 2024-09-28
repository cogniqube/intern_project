import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SignupPassword.dart';
import 'package:intern_project/pages/Login/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _hasInput = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateInputState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateInputState);
    _emailController.dispose();
    super.dispose();
  }

  void _updateInputState() {
    setState(() {
      _hasInput = _emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
             Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
          },
        ),
        title: const Text('Sign up'),
        centerTitle: true,
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
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasInput ? Colors.orange : Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasInput ? Colors.orange : Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasInput ? Colors.orange : Colors.white,
                    ),
                  ),
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
                   Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hasInput ? Colors.orange : Colors.white,
                  foregroundColor: _hasInput ? Colors.white : Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Square corners
                    side: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}