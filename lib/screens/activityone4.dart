// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class LevelOneScreen4 extends StatefulWidget {
  @override
  _LevelOneScreenState createState() => _LevelOneScreenState();
}

class _LevelOneScreenState extends State<LevelOneScreen4> {
  // Correct order of image names
  final List<String> correctOrder = ['4-1.jpg', '4-2.jpg', '4-3.jpg', '4-4.jpg'];

  // Random order for displaying at the top
  List<String> shuffledOrder = ['4-2.jpg', '4-1.jpg', '4-4.jpg', '4-3.jpg'];

  // List to hold the user's dragged images, initially empty (null represents empty)
  List<String?> placedImages = [null, null, null, null];

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

    // Set fixed size for images and containers
    final double imageSize = screenWidth * 0.2; // 20% of the screen width

    return Scaffold(
      appBar: AppBar(
        title: Text('LEVEL-4'),
      ),
      body: Column(
        children: [
          // Randomly ordered images to drag from
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: shuffledOrder
                  .map(
                    (imageName) => Draggable<String>(
                      data: imageName,
                      feedback: Image.asset(
                        'images/$imageName',
                        height: imageSize,
                        width: imageSize,
                      ),
                      childWhenDragging: Container(
                        height: imageSize,
                        width: imageSize,
                        color: Colors.grey,
                      ),
                      child: Image.asset(
                        'images/$imageName',
                        height: imageSize,
                        width: imageSize,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          // Empty boxes where images will be dragged into
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
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
                        color: placedImages[index] == null
                            ? Colors.white
                            : Colors.blue[100],
                      ),
                      child: placedImages[index] == null
                          ? Center(
                              child: Text(
                                '${index + 1}', // Label with numbers
                                style: TextStyle(fontSize: 24),
                              ),
                            )
                          : Image.asset(
                              'images/${placedImages[index]}',
                              height: imageSize,
                              width: imageSize,
                            ),
                    );
                  },
                );
              }),
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
                  placedImages = [null, null, null, null];
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
}
