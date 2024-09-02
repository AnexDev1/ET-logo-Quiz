import 'package:ethiopic_logo_quiz/screens/level_screen/level_screen.dart';
import 'package:flutter/material.dart';

class LevelBox extends StatelessWidget {
  final int index;
  final String category;

  const LevelBox({super.key, required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    final String categoryKey = category.split(' ')[0].toLowerCase();
    final String logoImagePath = 'assets/images/$categoryKey/logo_${index + 1}.png';
    final String answerLogoImagePath = 'assets/images/$categoryKey/logo_${index + 1}_ans.png';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LevelScreen(
              logoImagePath: logoImagePath,
              answer: 'Answer',
              answerLogoImagePath: answerLogoImagePath,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(
            logoImagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}