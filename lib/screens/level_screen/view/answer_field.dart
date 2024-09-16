import 'dart:math' show sin;

import 'package:ethiopic_logo_quiz/controller/level_controller.dart';
import 'package:flutter/material.dart';

class AnswerField extends StatelessWidget {
  final LevelController controller;
  final int index;
  const AnswerField({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("AnswerField tapped at index: $index"); // Debug print
        controller.onInputFieldTap(index);
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: controller.isIncorrect ? 10.0 : 0.0),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value * sin(value * 3), 0),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: controller.isIncorrect ? Colors.red : Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  controller.inputLetters[index].toUpperCase(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
