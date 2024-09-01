import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String letter;
  const AnswerButton(this.letter,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}