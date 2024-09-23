import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/celebrity_application.dart';
import 'package:intern_project/pages/profile/customer_service.dart';
import 'package:intern_project/pages/profile/notification.dart';
import 'package:intern_project/pages/profile/profle.dart';
import 'package:intern_project/pages/profile/service_info.dart';
import 'package:intern_project/pages/profile/shoppinginfo.dart';
import 'package:intern_project/styles/app_colors.dart'; 

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
     final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('assets/ss.png'),
                  ),
                  const SizedBox(width: 16.0),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Run',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        'point 1,000 Points',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 12.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    child: const Text('Point charging'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  
                   
                  InkWell(
                    onTap: () {
                      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   EditProfileScreen()),
    );
                      
                    },
                    child: const Text(
                      'Edit My Information',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30.0),
                  
                   
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>    ShoopingInfo()), // Replace with your LoginScreen widget
              );
                                          },
                    child: const Text(
                      'My Shopping Info',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30.0),
                  
                  
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  CustomerService()), // Replace with your LoginScreen widget
              );
                     
                    },
                    child: const Text(
                      'Service Center',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30.0),
                  
                   
                  InkWell(
                    onTap: () {
                       
                      Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  NotificationSettings()), // Replace with your LoginScreen widget
              );
                    },
                    child: const Text(
                      'Notification Settings',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30.0),
                  
                   
                  InkWell(
                    onTap: () {
                      
                      Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  ServiceInformationScreen()), // Replace with your LoginScreen widget
              );
                    },
                    child: const Text(
                      'Service Information',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 50.0),
                  
                  ElevatedButton(
                    onPressed: () {Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  CelebrityApplication()), // Replace with your LoginScreen widget
              );},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Button background color
                      foregroundColor: Colors.white,  // Button text color
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90.0, // Reduced padding to avoid squeezing
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
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Celebrity application'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}