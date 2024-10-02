import 'package:flutter/material.dart';
import 'package:tugass2/home.dart';
import 'package:tugass2/login.dart';

class Profile extends StatelessWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context){
          return Home(username: username);
        }));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username label
            const Text(
              'Username',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Username display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[300],
              child: Text(username),
            ),
            const SizedBox(height: 20),
            // About App text
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[300],
              child: const Text(
                'About App: This app provides information about the features and functions of our product.', // Add your own description here
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            // Logout button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const login()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set button color to red
                minimumSize: const Size(double.infinity, 48), // Full width button
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
