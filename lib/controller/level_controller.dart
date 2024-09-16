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
    Map<String, int> letterCounts = {};
    for (var letter in answer.toUpperCase().split('')) {
      letterCounts[letter] = (letterCounts[letter] ?? 0) + 1;
    }

    availableLetters = [];
    letterCounts.forEach((letter, count) {
      // Add the exact number of occurrences for each letter
      availableLetters.addAll(List.filled(count, letter));
    });

    // Add some random letters
    Random random = Random();
    int extraLettersNeeded = answer.length + 5 - availableLetters.length;
    for (int i = 0; i < extraLettersNeeded; i++) {
      String randomLetter = String.fromCharCode(random.nextInt(26) + 65); // A-Z
      availableLetters.add(randomLetter);
    }

    availableLetters.shuffle();
    notifyListeners();
  }

  void onLetterTap(
      String letter, BuildContext context, VoidCallback onNextLevel) {
    int emptyIndex = inputLetters.indexOf('');
    if (emptyIndex != -1) {
      inputLetters[emptyIndex] = letter;
      // Remove only one occurrence of the letter from availableLetters
      availableLetters.remove(letter);
      if (inputLetters.every((letter) => letter != '')) {
        _checkAnswer(context, onNextLevel);
      }
      notifyListeners();
    }
  }

  void onInputFieldTap(int index) {
    if (inputLetters[index] != '') {
      String letter = inputLetters[index];
      inputLetters[index] = '';
      availableLetters.add(letter);
      availableLetters.sort();
      notifyListeners();
    }
  }

  void _checkAnswer(BuildContext context, VoidCallback onNextLevel) {
    if (inputLetters.join('').toUpperCase() == answer.toUpperCase()) {
      isIncorrect = false;
      onCorrectAnswer();
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
    _generateAvailableLetters();
    notifyListeners();
  }
}
