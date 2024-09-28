import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SelfCertification.dart';
import 'package:intern_project/pages/Login/SignupEmail.dart';
import 'package:intern_project/pages/Login/SignupPassword.dart';
import 'package:intern_project/pages/Login/login.dart';
class SignupPassword extends StatefulWidget {
  const SignupPassword({super.key});

  @override
  State<SignupPassword> createState() => _SignupPasswordState();
}

class _SignupPasswordState extends State<SignupPassword> {
 final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _hasEmailInput = false;
  bool _hasPasswordInput = false;
  bool _hasConfirmPasswordInput = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _hasEmailInput = _emailController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _hasPasswordInput = _passwordController.text.isNotEmpty;
      });
    });
    _confirmPasswordController.addListener(() {
      setState(() {
        _hasConfirmPasswordInput = _confirmPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
                      MaterialPageRoute(builder: (context) => SignUpPage()),
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
               
              const SizedBox(height: 8.0),
              
              _buildTextFormField(
                controller: _passwordController,
                hintText: 'Enter your password',
                hasInput: _hasPasswordInput,
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              _buildTextFormField(
                controller: _confirmPasswordController,
                hintText: 'Confirm your password',
                hasInput: _hasConfirmPasswordInput,
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
            ElevatedButton(
                onPressed: () {
                   Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hasConfirmPasswordInput  & _hasPasswordInput ? Colors.orange : Colors.white,
                  foregroundColor:  _hasConfirmPasswordInput  & _hasPasswordInput  ? Colors.white : Colors.orange,
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

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required bool hasInput,
    bool obscureText = true,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasInput ? Colors.orange : Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasInput ? Colors.orange : Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasInput ? Colors.orange : Colors.white,
          ),
        ),
      ),
      validator: validator,
    );
  }
}