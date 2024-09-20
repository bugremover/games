import 'package:flutter/material.dart';
import 'dart:math';

class HardScreen6 extends StatefulWidget {
  @override
  _HardScreen6State createState() => _HardScreen6State();
}

class _HardScreen6State extends State<HardScreen6> {
  final String correctWord = 'bicycle';
  late List<String> scrambledLetters;
  List<String> userAnswer = [];
  String feedback = '';

  @override
  void initState() {
    super.initState();
    scrambledLetters = shuffleLetters(correctWord.split(''));
  }

  List<String> shuffleLetters(List<String> letters) {
    letters.shuffle(Random());
    return letters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEVEL-6'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('../assets/bicycle.jpeg', height: 200), // Ensure the asset path is correct
          ),
          Text(
            'Arrange the letters:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Draggable letters
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scrambledLetters.map((letter) {
              return Draggable<String>(
                data: letter,
                child: LetterBox(letter: letter),
                feedback: Material(
                  color: Colors.transparent,
                  child: LetterBox(letter: letter),
                ),
                childWhenDragging: LetterBox(letter: ''), // Hide letter while dragging
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          // Drag target for user answer
          DragTarget<String>(
            onAccept: (letter) {
              setState(() {
                if (userAnswer.length < correctWord.length) {
                  userAnswer.add(letter);
                  scrambledLetters.remove(letter); // Remove the letter from scrambled letters
                }
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(correctWord.length, (index) {
                  return LetterBox(
                    letter: index < userAnswer.length ? userAnswer[index] : '',
                  );
                }),
              );
            },
          ),
          SizedBox(height: 20),
          // Submit button
          ElevatedButton(
            onPressed: checkAnswer,
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
          // Feedback icons
          if (userAnswer.join() == correctWord)
            Icon(Icons.check, color: Colors.green, size: 50)
          else if (userAnswer.isNotEmpty)
            Icon(Icons.close, color: Colors.red, size: 50),
        ],
      ),
    );
  }

  void checkAnswer() {
    setState(() {
      // No additional logic needed; UI updates automatically
    });
  }
}

class LetterBox extends StatelessWidget {
  final String letter;

  const LetterBox({required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amber,
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HardScreen6()));
}
