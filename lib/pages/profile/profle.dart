import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/password.dart';
import 'package:intern_project/pages/profile/points.dart';
import 'package:intern_project/pages/profile/referral.dart'; 
 
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _profileImageUrl = 'assets/ss.png'; // Initial profile image URL
  String _username = 'run'; // Initial username
  final TextEditingController _usernameController = TextEditingController();
  bool _isEditing = false; // To track editing state

  // Method to remove profile image
  void _removeProfileImage() {
    setState(() {
      _profileImageUrl = null; // Remove the profile image
    });
  }

  // Method to start editing the username
  void _startEditing() {
    _usernameController.text = _username; // Set the current username in the controller
    setState(() {
      _isEditing = true; // Set editing state to true
    });
  }

  // Method to save the edited username
  void _saveUsername() {
    setState(() {
      _username = _usernameController.text; // Update username
      _isEditing = false; // Set editing state to false
    });
  }

  // Placeholder methods for other functionalities
  void _changePassword() {
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   ResetPassword()),
    );
  }

  void _referralRegistration() {
    // Implement referral registration functionality
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   Referral()),
    );
  }

  void _points() {
   Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>   Points()), // Replace with your LoginScreen widget
              );
  }

  void _logout() {
    // Show confirmation dialog for logout
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout Successful'),
        content: const Text(
          'If you press "Logout", you will be taken to the login screen.',
          style: TextStyle(fontSize: 12), // Smaller font for the message
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Navigate to the login screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>   EditProfileScreen()), // Replace with your LoginScreen widget
              );
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
     
  }

  void _withdrawal() {
    // Implement withdrawal functionality
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Membership Withdrawal'),
          content: const Text('Do you really want to leave?'),
          actions: [
           TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              
            },
            child: const Text('Withdrwal'),
          ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: const Text('Edit My Information'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: _profileImageUrl != null
                        ? NetworkImage(_profileImageUrl!)
                        : null,
                    backgroundColor: Colors.grey[200],
                    child: _profileImageUrl == null
                        ? const Icon(
                            Icons.person,
                            size: 60.0,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                  if (_profileImageUrl != null)
                    Positioned(
                      right: -5,
                      top: -5,
                      child: IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.orange, size: 30),
                        onPressed: _removeProfileImage,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            // Username and edit icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isEditing
                    ? Expanded(
                        child: TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter username',
                          ),
                        ),
                      )
                    : Text(
                        _username,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: _isEditing ? null : _startEditing,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Save button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                onPressed: _isEditing ? _saveUsername : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // List of options
            ListTile(
              title: const Text('Change Password'),
              onTap: _changePassword,
            ),
            const Divider(),
            ListTile(
              title: const Text('Referral Registration'),
              onTap: _referralRegistration,
            ),
            const Divider(),
            ListTile(
              title: const Text('Points'),
              onTap: _points,
            ),
            const Divider(),
            ListTile(
              title: const Text('Log Out'),
              onTap: _logout,
            ),
            const Divider(),
            ListTile(
              title: const Text('Withdrawal'),
              onTap: _withdrawal,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
