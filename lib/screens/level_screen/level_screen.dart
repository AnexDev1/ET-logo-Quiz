// lib/screens/level_screen.dart
import 'package:flutter/material.dart';
import 'dart:math';

class LevelScreen extends StatefulWidget {
  final String logoImagePath;
  final String answer;
  final String answerLogoImagePath;

  const LevelScreen({
    super.key,
    required this.logoImagePath,
    required this.answer,
    required this.answerLogoImagePath,
  });

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  List<String> inputLetters = [];
  List<String> availableLetters = [];

  @override
  void initState() {
    super.initState();
    inputLetters = List.filled(widget.answer.length, '');
    _generateAvailableLetters();
  }

  void _generateAvailableLetters() {
    Set<String> lettersSet = widget.answer.toUpperCase().split('').toSet();
    Random random = Random();

    while (lettersSet.length < widget.answer.length + 5) {
      lettersSet.add(String.fromCharCode(random.nextInt(26) + 65)); // A-Z
    }

    availableLetters = lettersSet.toList();
    availableLetters.shuffle();
  }

  void _onLetterTap(String letter) {
    setState(() {
      for (int i = 0; i < inputLetters.length; i++) {
        if (inputLetters[i] == '') {
          inputLetters[i] = letter;
          break;
        }
      }
      _checkAnswer();
    });
  }

  void _onInputFieldTap(int index) {
    setState(() {
      inputLetters[index] = '';
    });
  }

  void _checkAnswer() {
    if (inputLetters.join('') == widget.answer.toUpperCase()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Congratulations!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You have solved the puzzle!'),
              const SizedBox(height: 20),
              Image.asset(widget.answerLogoImagePath),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to the next level or perform any other action
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 200,
              width: double.infinity,
              child: Image.asset(widget.logoImagePath),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.answer.length, (index) {
                return GestureDetector(
                  onTap: () => _onInputFieldTap(index),
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        inputLetters[index].toUpperCase(),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: availableLetters.map((letter) {
                return GestureDetector(
                  onTap: () => _onLetterTap(letter),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        letter.toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}