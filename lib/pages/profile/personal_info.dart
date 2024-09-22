import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/service_info.dart'; 

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
 Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  ServiceInformationScreen()), // Replace with your LoginScreen widget
              );
          }
        ),
        title: const Text('Personal Information Processing Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Items of Personal Information We Collect',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects the minimum amount of personal information necessary for contract implementation, user identification, service improvement, new service development, membership registration, and counseling on service provision.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects essential items essential to perform the essential functions of the service and options for providing more specialized services with the prior consent of the user.',
              ),
              const SizedBox(height: 32),
              Text(
                'Items of Personal Information We Collect',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects the minimum amount of personal information necessary for contract implementation, user identification, service improvement, new service development, membership registration, and counseling on service provision.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects essential items essential to perform the essential functions of the service and options for providing more specialized services with the prior consent of the user.',
              ),
              const SizedBox(height: 32),
              Text(
                'Items of Personal Information We Collect',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects the minimum amount of personal information necessary for contract implementation, user identification, service improvement, new service development, membership registration, and counseling on service provision.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects essential items essential to perform the essential functions of the service and options for providing more specialized services with the prior consent of the user.',
              ),
              const SizedBox(height: 32),
              Text(
                'Items of Personal Information We Collect',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects the minimum amount of personal information necessary for contract implementation, user identification, service improvement, new service development, membership registration, and counseling on service provision.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Routine Live collects essential items essential to perform the essential functions of the service and options for providing more specialized services with the prior consent of the user.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}