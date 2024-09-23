import 'package:flutter/material.dart'; 
import 'package:intern_project/pages/profile/profile_page.dart'; 

class CelebrityApplication extends StatefulWidget {
  const CelebrityApplication({super.key});

  @override
  State<CelebrityApplication> createState() => _CelebrityApplicationState();
}

class _CelebrityApplicationState extends State<CelebrityApplication> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _activityChannelAddressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _dateOfBirthController.dispose();
    _activityChannelAddressController.dispose();
    super.dispose();
  }

  // Method to show the first pop-up
  void _showFirstDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('I applied for a celebrity'),
          content: const Text(
            'A separate information email will be sent after reviewing the information you entered.',
            style: TextStyle(fontSize: 14.0),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the first pop-up
                _showSecondDialog(); // Open the second pop-up
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // Method to show the second pop-up
  void _showSecondDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Request to enter essential information.'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please enter all the information to become a celebrity.',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Text(
                '*Required: Name, mobile phone number, email, date of birth, activity channel address.',
                style: TextStyle(fontSize: 14.0, color: Colors.red),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the second pop-up
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => ProfilePage(title: "Profile")),
            );
          },
        ),
        title: const Text('Requesting a Celebrity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Container for the image
            Container(
  height: 80, // Adjust the height as needed
  width: 130,
  margin: const EdgeInsets.only(bottom: 16.0), // Space below the container
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    color: Colors.grey[300], // Background color as fallback
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.asset(
      "assets/celebrity.png",
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Center(
          child: Icon(
            Icons.error,
            size: 24.0,
            color: Colors.grey[700],
          ),
        );
      },
    ),
  ),
),

            // Form starts here
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
      'When you become a celebrity,\nyou can be offered broadcasting and product sales.',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Please type your name.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _phoneNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Phone number',
                          hintText: 'Please enter your cell phone number.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          hintText:
                              'The results will be delivered through the mail you entered. Please type it correctly.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email.';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _dateOfBirthController,
                        decoration: const InputDecoration(
                          labelText: 'The date of one\'s birth',
                          hintText:
                              'It is used as an auxiliary means to check celebrity information.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your date of birth.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _activityChannelAddressController,
                        decoration: const InputDecoration(
                          labelText: 'The activity channel address.',
                          hintText: 'Instagram, YouTube, etc.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your activity channel address.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button background color
                      foregroundColor: Colors.white, 
                       // Button text color
                      padding: const EdgeInsets.symmetric(
                        horizontal: 130.0, // Reduced padding to avoid squeezing
                        vertical: 12.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Rectangular button
                      ),
                      minimumSize: const Size(250, 50), // Increased width
                    ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Show the first pop-up
                            _showFirstDialog();
                          }
                        },
                        child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Application'),
                    ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
