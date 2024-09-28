import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SignupPassword.dart';
import 'package:intern_project/pages/profile/profile_page.dart'; 
class SelfCertificationScreen extends StatefulWidget {
  const SelfCertificationScreen({Key? key}) : super(key: key);

  @override
  _SelfCertificationScreenState createState() => _SelfCertificationScreenState();
}

class _SelfCertificationScreenState extends State<SelfCertificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _authNumberController = TextEditingController();
  bool _hasPhoneInput = false;
  bool _hasAuthInput = false;

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_updatePhoneInputState);
    _authNumberController.addListener(_updateAuthInputState);
  }

  void _updatePhoneInputState() {
    setState(() {
      _hasPhoneInput = _phoneNumberController.text.isNotEmpty;
    });
  }

  void _updateAuthInputState() {
    setState(() {
      _hasAuthInput = _authNumberController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _phoneNumberController.removeListener(_updatePhoneInputState);
    _authNumberController.removeListener(_updateAuthInputState);
    _phoneNumberController.dispose();
    _authNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SignupPassword()),
            );
          },
        ),
        title: const Text('Self-certification'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Cell phone number',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your cell phone number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasPhoneInput ? Colors.orange : Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasPhoneInput ? Colors.orange : Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasPhoneInput ? Colors.orange : Colors.white,
                    ),
                  ),
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
                   Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ProfilePage(title: "Profile")),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hasPhoneInput ? Colors.orange : Colors.white,
                  foregroundColor:  _hasAuthInput ? Colors.white : Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Square corners
                    side: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text('Request authentication'),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Enter the authentication number',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _authNumberController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter the authentication number you received by text',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasAuthInput ? Colors.orange : Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasAuthInput ? Colors.orange : Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _hasAuthInput ? Colors.orange : Colors.white,
                    ),
                  ),
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
                   Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ProfilePage(title: "Profile")),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hasAuthInput? Colors.orange : Colors.white,
                  foregroundColor:  _hasAuthInput ? Colors.white : Colors.orange,
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