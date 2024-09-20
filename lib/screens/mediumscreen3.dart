// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MediumScreen3 extends StatefulWidget {
  @override
  _LevelOneScreenState createState() => _LevelOneScreenState();
}

class _LevelOneScreenState extends State<MediumScreen3> {
  // Correct order of image names
  final List<String> correctOrder = [
    '8-1.png',
    '8-2.png',
    '8-3.png',
    '8-4.png',
    '8-5.png',
    '8-6.png'
  ];

  // Random order for displaying at the top
  List<String> shuffledOrder = [
    '8-5.png',
    '8-6.png',
    '8-3.png',
    '8-1.png',
    '8-4.png',
    '8-2.png'
  ];

  // List to hold the user's dragged images, initially empty
  List<String?> placedImages = List<String?>.filled(6, null);

  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    // Shuffle the order of the images
    shuffledOrder.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width for adaptive layout
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Set fixed size for images and containers based on screen width
    final double imageSize = screenWidth * 0.18; // 18% of the screen width

    return Scaffold(
      appBar: AppBar(
        title: Text('LEVEL-3'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Randomly ordered images to drag from
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 5 images per row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: shuffledOrder.length,
                itemBuilder: (context, index) {
                  return _buildDraggable(shuffledOrder[index], imageSize);
                },
              ),
            ),

            // Empty boxes where images will be dragged into
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 5 images per row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: placedImages.length,
                itemBuilder: (context, index) {
                  return _buildDragTarget(index, imageSize);
                },
              ),
            ),

            // Submit button to check if the images are in the correct order
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCorrect = _checkOrder();
                  if (isCorrect) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Correct!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Wrong Order! Try again.')),
                    );
                    // Reset placed images if the sequence is wrong
                    placedImages = List<String?>.filled(6, null);
                  }
                });
              },
              child: Text('Submit'),
            ),

            if (isCorrect)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Function to check if the user dragged images in the correct order
  bool _checkOrder() {
    for (int i = 0; i < placedImages.length; i++) {
      if (placedImages[i] != correctOrder[i]) {
        return false;
      }
    }
    return true;
  }

  // Helper method to build draggable widget
  Widget _buildDraggable(String imageName, double imageSize) {
    return Draggable<String>(
      data: imageName,
      feedback: Image.asset(
        '../assets/$imageName',
        height: imageSize,
        width: imageSize,
      ),
      childWhenDragging: Container(
        height: imageSize,
        width: imageSize,
        color: Colors.grey,
      ),
      child: Image.asset(
        '../assets/$imageName',
        height: imageSize,
        width: imageSize,
        fit: BoxFit.cover,
      ),
    );
  }

  // Helper method to build drag target box
  Widget _buildDragTarget(int index, double imageSize) {
    return DragTarget<String>(
      onAccept: (receivedImage) {
        setState(() {
          placedImages[index] = receivedImage;
        });
      },
      builder: (context, accepted, rejected) {
        return Container(
          height: imageSize,
          width: imageSize,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color:
                placedImages[index] == null ? Colors.white : Colors.blue[100],
          ),
          child: placedImages[index] == null
              ? Center(
                  child: Text(
                    '${index + 1}', // Label with numbers
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : Image.asset(
                  '../assets/${placedImages[index]}',
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.cover,
                ),
        );
      },
    );
  }
}
