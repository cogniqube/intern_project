import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/SignupAgreement.dart';
import 'package:intern_project/pages/Login/SignupEmail.dart';
import 'package:intern_project/pages/Login/login.dart';
import 'package:intern_project/styles/gradient_button.dart';  
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
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Card with white background and orange elements
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildPermissionItem(
                      icon: const Icon(Icons.camera_alt, color: Colors.orange),
                      title: 'Camera',
                      titleColor: Colors.orange,
                      description: 'Profile picture settings',
                      descriptionColor: Colors.orange,
                    ),
                    const Divider(color: Colors.white),
                    _buildPermissionItem(
                      icon: const Icon(Icons.photo_library, color: Colors.orange),
                      title: 'Photos / Media / Files',
                      titleColor: Colors.orange,
                      description: 'Utilization to register photos and videos',
                      descriptionColor: Colors.orange,
                    ),
                    const Divider(color: Colors.white),
                    _buildPermissionItem(
                      icon: const Icon(Icons.notifications, color: Colors.orange),
                      title: 'Notification (optional)',
                      titleColor: Colors.orange,
                      description: 'Receive notification messages such as service changes and events',
                      descriptionColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '* How to change access rights',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.orange),
                  ),
                  SizedBox(height: 8),
                  Text(
                    ' Notification Settings > Each permission On/Off',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '* If the permission is denied, the function works normally. It may not work.',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.orange),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '* After denying, you can allow it again in the settings.',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.orange),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),

            // Replace ElevatedButton with GradientButton
            GradientButton(
              text: 'Confirm',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const TermsAndConditionsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionItem({
    required Widget icon,
    required String title,
    required String description,
    required Color titleColor,
    required Color descriptionColor,
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
                    color: titleColor,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(color: descriptionColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
