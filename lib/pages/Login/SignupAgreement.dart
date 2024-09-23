import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SignupEmail.dart';
import 'package:intern_project/pages/Login/login.dart'; 

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState
    extends State<TermsAndConditionsScreen> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  LoginScreen()), // Replace with your LoginScreen widget
              );
          },
        ),
        title: const Text('Terms and conditions'),
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
                title: const Text('All agreements to the terms and conditions'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Terms and conditions',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const ExpansionTile(
                title: Text('Article 1 (Purpose)'),
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
              const ExpansionTile(
                title: Text('personal information collection'),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Routine Live collects the minimum amount of personal information necessary for contract implementation, user identification, service improvement, new service development, membership registration, and counseling on service provision.\n\nRoutine Live collects essential items essential to perform',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: _agreedToTerms
                      ? () {
                          Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpPage()), // Replace with your LoginScreen widget
              );
                        }
                      : null,
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
