import 'package:flutter/material.dart'; 
import 'package:intern_project/pages/profile/faq.dart';
import 'package:intern_project/pages/profile/notice.dart';
import 'package:intern_project/pages/profile/profile_page.dart';
 

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
         backgroundColor: Colors.white,
        appBar: AppBar(
           backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () { 
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>ProfilePage(title: "Profile") ), // Replace with your LoginScreen widget
              );
            },
          ),
          title: const Text('Customer Service'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Notice'),
              onTap: () {
                 Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>  NoticePage()), // Replace with your LoginScreen widget
              );
              },
            ),
            ListTile(
              title: Text('Frequently asked question'),
              onTap: () {
                Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FrequeuntlyAsked(),
              ),
            );
              },
            ),
            const ListTile(
              title: Text('1:1 inquiry'),
            ),
          ],
        ),
      ),
    );
  }
}

 