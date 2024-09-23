import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/login.dart'; 

class AppAccessPermissionGuide extends StatelessWidget {
  const AppAccessPermissionGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'App access permission guide',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange),
            ),
            const SizedBox(height: 16),
            const Text(
              'To use OneQ Live, follow the steps below.\nYou are using selective access rights.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Card with white background and orange elements
            Card(
              color: Colors.white, // Set background color to white
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.orange, width: 2), // Orange border
                borderRadius: BorderRadius.circular(8), // Slightly rounded corners
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildPermissionItem(
                      icon: const Icon(Icons.camera_alt, color: Colors.orange), // Orange icon
                      title: 'Camera',
                      titleColor: Colors.orange, // Orange text
                      description: 'Profile picture settings',
                      descriptionColor: Colors.orange, // Orange description
                    ),
                    const Divider(color: Colors.white), // Orange divider
                    _buildPermissionItem(
                      icon: const Icon(Icons.photo_library, color: Colors.orange), // Orange icon
                      title: 'Photos / Media / Files',
                      titleColor: Colors.orange, // Orange text
                      description: 'Utilization to register photos and videos',
                      descriptionColor: Colors.orange, // Orange description
                    ),
                    const Divider(color: Colors.white), // Orange divider
                    _buildPermissionItem(
                      icon: const Icon(Icons.notifications, color: Colors.orange), // Orange icon
                      title: 'Notification (optional)',
                      titleColor: Colors.orange, // Orange text
                      description: 'Receive notification messages such as service changes and events',
                      descriptionColor: Colors.orange, // Orange description
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
            // const Text('* How to change access rights',textAlign: TextAlign.left,),
            // const SizedBox(height: 8),
            // const Text('Notification Settings > Each permission On/Off'),
            // const SizedBox(height: 8),
            // const Text(
            //     '* If the permission is denied, the function works normally. It may not work.',textAlign: TextAlign.left,),
            // const SizedBox(height: 8),
            // const Text(
            //     '* After denying, you can allow it again in the settings.',textAlign: TextAlign.left,),
            // const SizedBox(height: 32),
            
Container(
  alignment: Alignment.centerLeft, // Align content to the left
  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Optional padding for spacing
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Align children text to the left
    children: [
      Text(
        '* How to change access rights',
        textAlign: TextAlign.left, // Left-align text inside Text widget
         style: TextStyle(color: Colors.orange),
      ),
      SizedBox(height: 8),
      Text(
        'Notification Settings > Each permission On/Off',
        textAlign: TextAlign.left, // Left-align text inside Text widget
      ),
      SizedBox(height: 8),
      Text(
        '* If the permission is denied, the function works normally. It may not work.',
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.orange), // Left-align text inside Text widget
      ),
      SizedBox(height: 8),
      Text(
        '* After denying, you can allow it again in the settings.',
        textAlign: TextAlign.left, // Left-align text inside Text widget
        style: TextStyle(color: Colors.orange),
      ),
      SizedBox(height: 32),
    ],
  ),
),
            // Confirm Button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button background color
                      foregroundColor: Colors.white,  // Button text color
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100.0, // Reduced padding to avoid squeezing
                        vertical: 12.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Rectangular button
                      ),
                      minimumSize: const Size(330, 50), // Increased width
                    ),
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  // Updated _buildPermissionItem with color parameters
  Widget _buildPermissionItem({
    required Widget icon,
    required String title,
    required String description,
    required Color titleColor, // Accepting custom title color
    required Color descriptionColor, // Accepting custom description color
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: titleColor, // Apply title color
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(color: descriptionColor), // Apply description color
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
