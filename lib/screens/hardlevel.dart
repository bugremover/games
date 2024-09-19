import 'package:flutter/material.dart';
import 'package:games/screens/hardlscreen1.dart';
import 'package:games/screens/hardscreen2.dart';
import 'package:games/screens/hardscreen3.dart';
import 'package:games/screens/hardscreen4.dart';
import 'package:games/screens/hardscreen5.dart';
import 'package:games/screens/hardscreen6.dart';

// Import your LevelOneScreen1

class HardLevelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        title: Text('Hard Level', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Correct Spelling',
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
                        MaterialPageRoute(builder: (context) => HardScreen1()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '2',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HardScreen2()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '3',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HardScreen3()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '4',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HardScreen4()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '5',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HardScreen5()),
                      );
                    },
                  ),
                  ActivityButton(
                    number: '6',
                    onPressed: () {
                      // Placeholder for other activities
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HardScreen6()),
                      );
                    },
                  ),
                  // ActivityButton(
                  //   number: '5',
                  //   onPressed: () {
                  //     // Placeholder for other activities
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => MediumScreen7()),
                  //     );
                  //   },
                  // ),
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
