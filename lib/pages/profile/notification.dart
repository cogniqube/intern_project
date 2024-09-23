import 'package:flutter/material.dart'; 
import 'package:intern_project/pages/profile/profile_page.dart'; 

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool liveNotification = true;
  bool feedNotification = false;
  bool storeNotification = false;
  bool etcNotification = false;

  // Method to show the alert dialog
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification Update'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // Method to handle switch changes
  void _handleSwitchChange(bool value, String notificationType) {
    setState(() {
      if (notificationType == 'Live') {
        liveNotification = value;
      } else if (notificationType == 'Feed') {
        feedNotification = value;
      } else if (notificationType == 'Store') {
        storeNotification = value;
      } else if (notificationType == 'Etc') {
        etcNotification = value;
      }
    });

    // Show appropriate message based on switch value
    if (value) {
      _showDialog('Push notification has been changed to consent and reception status.');
    } else {
      _showDialog('The Push notification reception has been changed to Disagreement and Rejection status.');
    }
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
                MaterialPageRoute(builder: (context) => ProfilePage(title: "Profile")), // Replace with your LoginScreen widget
              );
          },
        ),
        title: const Text('Set notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Live notification'),
                Switch(
                  value: liveNotification,
                  onChanged: (value) {
                    _handleSwitchChange(value, 'Live');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Feed notification'),
                Switch(
                  value: feedNotification,
                  onChanged: (value) {
                    _handleSwitchChange(value, 'Feed');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Store notification'),
                Switch(
                  value: storeNotification,
                  onChanged: (value) {
                    _handleSwitchChange(value, 'Store');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Etc notification'),
                Switch(
                  value: etcNotification,
                  onChanged: (value) {
                    _handleSwitchChange(value, 'Etc');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
