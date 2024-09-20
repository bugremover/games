import 'package:flutter/material.dart';
import 'dart:math';

class HardScreen3 extends StatefulWidget {
  @override
  _HardScreen3State createState() => _HardScreen3State();
}

class _HardScreen3State extends State<HardScreen3> {
  final String correctWord = 'banana';
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
        title: Text('LEVEL-3'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('../assets/banana.jpeg', height: 200), // Ensure the asset path is correct
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
                childWhenDragging: LetterBox(letter: ''), // Hide the letter when dragging
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
          // Feedback text
          Text(
            feedback,
            style: TextStyle(fontSize: 24, color: feedback == 'Correct!' ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }

  void checkAnswer() {
    setState(() {
      if (userAnswer.join() == correctWord) {
        feedback = 'Correct!';
      } else {
        feedback = 'Try again!';
      }
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
  runApp(MaterialApp(home: HardScreen3()));
}
