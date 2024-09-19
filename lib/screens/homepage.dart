// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:games/screens/basiclevel.dart';
import 'package:games/screens/hardlevel.dart';
import 'package:games/screens/mediumlevel.dart';

// ignore: use_key_in_widget_constructors
class LevelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {
            // Settings action
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              // Profile action
            },
          ),
        ],
      ),
      body: Center(
        // Centering the column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SELECT LEVEL',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            LevelButton(
              text: 'BASIC LEVEL',
              color: Colors.green,
              onPressed: () {
                // Basic level action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasicLevelScreen()),
                );
              },
            ),
            LevelButton(
              text: 'MEDIUM LEVEL',
              color: Colors.pinkAccent,
              onPressed: () {
                // Medium level action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MediumLevelScreen()),
                );
              },
            ),
            LevelButton(
              text: 'HARD LEVEL',
              color: Colors.red,
              onPressed: () {
                // Hard level action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HardLevelScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_fire_department, color: Colors.orange),
                  Text('1', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.casino, color: Colors.black),
                  Text('Spin', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.card_giftcard, color: Colors.yellow),
                  Text('Reward', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  LevelButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
