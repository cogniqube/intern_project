import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/customer_service.dart'; 

class FrequeuntlyAsked extends StatefulWidget {
  const FrequeuntlyAsked({super.key});

  @override
  State<FrequeuntlyAsked> createState() => _FrequeuntlyAskedState();
}

class _FrequeuntlyAskedState extends State<FrequeuntlyAsked> {
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
                MaterialPageRoute(builder: (context) => CustomerService() ), // Replace with your LoginScreen widget
              );
          },
        ),
        title: const Text('Frequently asked question'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Did the Lunar New Year event end?'),
              trailing: Icon(Icons.arrow_drop_up),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Announcement on New Year\'s Day Event Announcement on New Year\'s Day Event Announcement on New Year\'s Day Event Announcement on New Year\'s Day Event Day Event Announcement on New Year\'s Day Event',
              ),
            ),
            ListTile(
              title: Text('Is this a question that you ask often?'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              title: Text('Is this a question that you ask often?'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              title: Text('Is this a question that you ask often?'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }

}