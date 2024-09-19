import 'package:flutter/material.dart';

class HardScreen4 extends StatefulWidget {
  @override
  _SpellingGamePageState createState() => _SpellingGamePageState();
}

class _SpellingGamePageState extends State<HardScreen4> {
  String correctWord = 'snake';
  List<String> scrambledLetters = ['e', 's', 'k', 'a', 'n'];
  List<String> userAnswer = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEVEL-4'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/tiger.png', height: 200),
          ),
          Text(
            'Arrange the letters:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scrambledLetters.map((letter) {
              return Draggable<String>(
                data: letter,
                child: LetterBox(
                    letter: userAnswer.contains(letter) ? '' : letter),
                feedback: Material(
                  color: Colors.transparent,
                  child: LetterBox(letter: letter),
                ),
                childWhenDragging: LetterBox(letter: ''),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          DragTarget<String>(
            onAccept: (letter) {
              setState(() {
                if (userAnswer.length < correctWord.length) {
                  userAnswer.add(letter);
                }
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(correctWord.length, (index) {
                  return LetterBox(
                      letter:
                          index < userAnswer.length ? userAnswer[index] : '');
                }),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: checkAnswer,
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
          if (userAnswer.join() == correctWord)
            Icon(Icons.check, color: Colors.green, size: 50),
          if (userAnswer.join() != correctWord && userAnswer.isNotEmpty)
            Icon(Icons.close, color: Colors.red, size: 50),
        ],
      ),
    );
  }

  void checkAnswer() {
    setState(() {});
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
