import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/customer_service.dart'; 

class NoticePage extends StatelessWidget {
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
                MaterialPageRoute(builder: (context) => CustomerService() ), // Replace with your LoginScreen widget
              );
          },
        ),
        title: Text('Notice'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Announcement related to Lunar New Year\'s Day event.'),
            subtitle: Text('2021.01.25'),
            trailing: Icon(Icons.arrow_drop_up),
          ),
          ListTile(
            title: Text('Announcement on New Year\'s Day Event Announcement'),
            subtitle: Text('on New Year\'s Day Event Announcement on New Year\'s Day Event Announcement on New Year\'s Day Event Day Event Announcement on New Year\'s Day Event'),
            trailing: Icon(Icons.arrow_drop_down),
          ),
          ListTile(
            title: Text('Notice'),
            subtitle: Text('2021.01.20'),
            trailing: Icon(Icons.arrow_drop_down),
          ),
          ListTile(
            title: Text('Notice'),
            subtitle: Text('2021.01.20'),
            trailing: Icon(Icons.arrow_drop_down),
          ),
          ListTile(
            title: Text('Notice'),
            subtitle: Text('2021.01.20'),
            trailing: Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }
}