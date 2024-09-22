import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/shoppinginfo.dart'; 

class DeliveryDestinationManagement extends StatefulWidget {
  @override
  _DeliveryDestinationManagementState createState() => _DeliveryDestinationManagementState();
}

class _DeliveryDestinationManagementState extends State<DeliveryDestinationManagement> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _homeAddressController = TextEditingController();
  final _detailedAddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _recipientController.dispose();
    _homeAddressController.dispose();
    _detailedAddressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  ShoopingInfo()), // Replace with your LoginScreen widget
              );
          },
        ),
        title: Text('Delivery Destination Management'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _recipientController,
                decoration: InputDecoration(
                  labelText: 'The recipient',
                  hintText: 'Please enter the name of the recipient.',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the recipient name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _homeAddressController,
                decoration: InputDecoration(
                  labelText: 'The address you receive',
                  hintText: 'Please enter your home address.',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your home address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _detailedAddressController,
                decoration: InputDecoration(
                  labelText: 'Detailed address',
                  hintText: 'Please enter the detailed address.',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the detailed address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  hintText: 'Please enter your cell phone number.',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the form data here
                    print('Recipient: ${_recipientController.text}');
                    print('Home Address: ${_homeAddressController.text}');
                    print('Detailed Address: ${_detailedAddressController.text}');
                    print('Phone Number: ${_phoneNumberController.text}');
                  }
                },
                child: Text('Save the delivery address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}