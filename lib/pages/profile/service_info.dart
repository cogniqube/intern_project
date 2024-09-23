
import 'package:flutter/material.dart'; 
import 'package:intern_project/pages/profile/personal_info.dart';
import 'package:intern_project/pages/profile/profile_page.dart';
import 'package:intern_project/pages/profile/terms.dart'; 

class ServiceInformationScreen extends StatelessWidget {
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
                MaterialPageRoute(builder: (context) => ProfilePage(title: "Profile")), // Replace with your LoginScreen widget
              );
          },
        ),
        title: Text('Service Information'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Terms and conditions'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  TermsAndConditionsScreen()), // Replace with your LoginScreen widget
              );
            },
          ),
          ListTile(
            title: Text('Personal information processing policy'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  PrivacyPolicy()), // Replace with your LoginScreen widget
              );}
          ),
          ListTile(
            title: Text('Service introduction'),
          ),
          ListTile(
            title: Text('Version information'),
            trailing: Text('v 1.0.0'),
          ),
        ],
      ),
    );
  }
}