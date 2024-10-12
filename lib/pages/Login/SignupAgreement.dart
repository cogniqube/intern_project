import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SignupEmail.dart';
import 'package:intern_project/pages/Login/login.dart';
import 'package:intern_project/styles/gradient_button.dart';
class Signupagreement extends StatefulWidget {
  const Signupagreement({super.key});

  @override
  State<Signupagreement> createState() => _SignupagreementState();
}

class _SignupagreementState extends State<Signupagreement> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
        title: const Text('Terms and conditions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                value: _agreedToTerms,
                onChanged: (value) {
                  setState(() {
                    _agreedToTerms = value ?? false;
                  });
                },
                title: const Text(
                  'All agreements to the terms and conditions',
                  style: TextStyle(color: Colors.orange),
                  textAlign: TextAlign.right,
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                checkColor: Colors.orange,
              ),
              const SizedBox(height: 16.0),

              // Terms and conditions title with dynamic icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Personal information collection',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.orange,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: _agreedToTerms ? Colors.orange : Colors.grey,
                    size: 24.0,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const ExpansionTile(
                title: Text(
                  'Article 1 (Purpose)',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                iconColor: Colors.orange, // Color when expanded
                collapsedIconColor: Colors.orange, // Color when collapsed
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Thank you for using the service provided by OneQ Co., Ltd. (hereinafter referred to as "Company"). The company is a company that makes it more convenient for you to use various Internet and mobile services.\n\nThese terms and conditions stipulate basic matters such as rights, obligations and responsibilities, conditions',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Personal Information Collection title with dynamic icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Personal information collection',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.orange,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: _agreedToTerms ? Colors.orange : Colors.grey,
                    size: 24.0,
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text(
                  'Personal information collection',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                iconColor: Colors.orange, // Color when expanded
                collapsedIconColor: Colors.orange, // Color when collapsed
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'intern_project Live collects the minimum amount of personal information necessary for contract implementation, user identification, service improvement, new service development, membership registration, and counseling on service provision.\n\nintern_project Live collects essential items essential to perform',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),

              // Gradient button
              Center(
                child: GradientButton(
              text: 'Next', 
              onPressed: () { 
                Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
               },
              
            ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}