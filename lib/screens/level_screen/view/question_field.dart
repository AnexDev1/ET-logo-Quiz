import 'package:flutter/material.dart';

class QuestionField extends StatelessWidget {
  const QuestionField({
    super.key,
    required this.logoImagePath,
  });

  final String logoImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      width: double.infinity,
      child: Image.asset(logoImagePath),
    );
  }
}