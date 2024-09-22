import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/deliverydestination.dart';
import 'package:intern_project/pages/profile/ordertrack.dart'; 
class ShoopingInfo extends StatefulWidget {
  const ShoopingInfo({super.key});

  @override
  State<ShoopingInfo> createState() => _ShoopingInfoState();
}

class _ShoopingInfoState extends State<ShoopingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('My shopping information'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Order / Tracking'),
            onTap: () {
              // Navigate to order/tracking screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>   OrderTrackingScreen()), // Replace with your LoginScreen widget
              );
            },
          ),
          ListTile(
            title: Text('Delivery destination management'),
            onTap: () {
              // Navigate to delivery destination management screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>   DeliveryDestinationManagement()), // Replace with your LoginScreen widget
              );
            },
          ),
        ],
      ),
    );
  }
}