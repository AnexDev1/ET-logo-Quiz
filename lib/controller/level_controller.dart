// lib/controllers/level_controller.dart
import 'dart:math';
import 'package:flutter/material.dart';

class LevelController extends ChangeNotifier {
  final String answer;
  final String answerLogoImagePath;
  final VoidCallback onCorrectAnswer;
  List<String> inputLetters = [];
  List<String> availableLetters = [];
  bool isIncorrect = false;

  LevelController({
    required this.answer,
    required this.answerLogoImagePath,
    required this.onCorrectAnswer,
  }) {
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

  void onLetterTap(
      String letter, BuildContext context, VoidCallback onNextLevel) {
    for (int i = 0; i < inputLetters.length; i++) {
      if (inputLetters[i] == '') {
        inputLetters[i] = letter;
        break;
      }
    }
    if (inputLetters.every((letter) => letter != '')) {
      _checkAnswer(context, onNextLevel);
    }
    notifyListeners();
  }

  void onInputFieldTap(int index) {
    if (inputLetters[index] != '') {
      inputLetters[index] = '';
      notifyListeners();
    }
  }

  void _checkAnswer(BuildContext context, VoidCallback onNextLevel) {
    if (inputLetters.join('').toUpperCase() == answer.toUpperCase()) {
      isIncorrect = false;
      onCorrectAnswer(); // Call the callback to add coins
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Congratulations!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You have solved the puzzle!'),
              const Text('You earned 25 coins!'),
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
    } else {
      isIncorrect = true;
      _shakeEffect();
    }
    notifyListeners();
  }

  void _shakeEffect() {
    Future.delayed(const Duration(milliseconds: 500), () {
      isIncorrect = false;
      notifyListeners();
    });
  }

  void _clearInputFields() {
    inputLetters = List.filled(answer.length, '');
    notifyListeners();
  }
}
