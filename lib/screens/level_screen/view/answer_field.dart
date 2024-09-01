import 'package:ethiopic_logo_quiz/controller/level_controller.dart';
import 'package:flutter/material.dart';

class AnswerField extends StatelessWidget {
  final LevelController controller;
  final int index;
  const AnswerField({
    super.key,required this.controller, required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          controller.inputLetters[index].toUpperCase(),
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}