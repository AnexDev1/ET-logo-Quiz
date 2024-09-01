import 'package:ethiopic_logo_quiz/screens/level_screen/level_screen.dart';
import 'package:flutter/material.dart';

class LevelBox extends StatelessWidget {
  const LevelBox({
    super.key,
    required this.index
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LevelScreen(
              logoImagePath: 'assets/images/logo_${index + 1}.jpg',
              answer: 'Answer',
              answerLogoImagePath: 'assets/images/logo_${index + 1}_ans.png',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Logo ${index + 1}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}