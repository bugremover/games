import 'package:flutter/material.dart';
import 'package:games/screens/activityone.dart';
import 'package:games/screens/activityone2.dart';
import 'package:games/screens/activityone3.dart';
import 'package:games/screens/activityone4.dart';
import 'package:games/screens/activityone5.dart'; // Import your LevelOneScreen1

class BasicLevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        title: Text('BASIC LEVEL', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'REGULAR ACTIVITIES',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 30),
          // Activities in two columns (Grid)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  ActivityButton(
                    number: '1',
                    onPressed: () {
                      // Navigate to LevelOneScreen1 when button '1' is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelOneScreen1()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '2',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelOneScreen2()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '3',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelOneScreen3()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '4',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelOneScreen4()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '5',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelOneScreen5()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom ActivityButton Widget
class ActivityButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;

  ActivityButton({required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
      ),
      child: Text(
        number,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
