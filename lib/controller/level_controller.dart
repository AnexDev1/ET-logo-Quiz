// lib/controllers/level_controller.dart
import 'dart:math';
import 'package:flutter/material.dart';

class LevelController extends ChangeNotifier {
  final String answer;
  final String answerLogoImagePath;
  List<String> inputLetters = [];
  List<String> availableLetters = [];

  LevelController({required this.answer, required this.answerLogoImagePath}) {
    inputLetters = List.filled(answer.length, '');
    _generateAvailableLetters();
  }

  void _generateAvailableLetters() {
    Set<String> lettersSet = answer.toUpperCase().split('').toSet();
    Random random = Random();

    while (lettersSet.length < answer.length + 5) {
      lettersSet.add(String.fromCharCode(random.nextInt(26) + 65)); // A-Z
    }

    availableLetters = lettersSet.toList();
    availableLetters.shuffle();
    notifyListeners();
  }

  void onLetterTap(String letter, BuildContext context, VoidCallback onNextLevel) {
    for (int i = 0; i < inputLetters.length; i++) {
      if (inputLetters[i] == '') {
        inputLetters[i] = letter;
        break;
      }
    }
    _checkAnswer(context, onNextLevel);
    notifyListeners();
  }

  void onInputFieldTap(int index) {
    inputLetters[index] = '';
    notifyListeners();
  }

  void _checkAnswer(BuildContext context, VoidCallback onNextLevel) {
    if (inputLetters.join('') == answer.toUpperCase()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Congratulations!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You have solved the puzzle!'),
              const SizedBox(height: 20),
              Image.asset(answerLogoImagePath),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearInputFields();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                _clearInputFields();
                Navigator.of(context).pop();
                onNextLevel();
              },
              child: const Text('Next'),
            ),
          ],
        ),
      );
    }
  }

  void _clearInputFields() {
    inputLetters = List.filled(answer.length, '');
    notifyListeners();
  }
}