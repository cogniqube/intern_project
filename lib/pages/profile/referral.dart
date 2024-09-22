import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard

class Referral extends StatefulWidget {
  const Referral({super.key});

  @override
  State<Referral> createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  final String _recommendationCode = 'JPL3H'; // Recommendation code

  void _copyToClipboard() {
  // // Copy the recommendation code to the clipboard
  // Clipboard.setData(ClipboardData(text: _recommendationCode)).then((_) {
  //   // Use the ScaffoldMessenger to show the SnackBar
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Recommendation code copied: $_recommendationCode'),
  //       duration: const Duration(seconds: 2), // Optional: set duration
  //     ),
  //   );
  // });
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Recommendation code copied: $_recommendationCode'),
        duration: const Duration(seconds: 2), // Optional: set duration
      ),
    );
}

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
              Navigator.pop(context); // Navigate back
            },
          ),
          title: const Text('Register as a Recommended Person'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter the recommended code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Please enter the recommended code.',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Perform recommendation action here
                },
                child: const Text('Recommend'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'My Recommendation Code',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_recommendationCode),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
        // Copy the recommendation code to the clipboard
        Clipboard.setData(ClipboardData(text: _recommendationCode)).then((_) {
          // Show a SnackBar to inform the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Recommendation code copied: $_recommendationCode'),
              duration: const Duration(seconds: 2), // Optional: set duration
            ),
          );
        });
      },
                    child: const Text('Copy'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Perform invite action here
                },
                child: const Text('Invite a Friend'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              // This can be removed if not needed
            ],
          ),
        ),
      ),
    );
  }
}
