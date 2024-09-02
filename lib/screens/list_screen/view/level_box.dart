import 'package:ethiopic_logo_quiz/screens/level_screen/level_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/category_answer_provider.dart';

class LevelBox extends StatelessWidget {
  final int index;
  final String category;

  const LevelBox({super.key, required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    final answers = context.read<CategoryAnswersProvider>().getAnswers(category);
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
              answer: answers[index],
              answerLogoImagePath: answerLogoImagePath,
              onNextLevel: () {
                _navigateToNextLevel(context, categoryKey, index + 1, answers);
              },
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

  void _navigateToNextLevel(BuildContext context, String categoryKey, int nextIndex, List<String> answers) {
    if (nextIndex < answers.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LevelScreen(
            logoImagePath: 'assets/images/$categoryKey/logo_${nextIndex + 1}.png',
            answer: answers[nextIndex],
            answerLogoImagePath: 'assets/images/$categoryKey/logo_${nextIndex + 1}_ans.png',
            onNextLevel: () {
              _navigateToNextLevel(context, categoryKey, nextIndex + 1, answers);
            },
          ),
        ),
      );
    } else {
      // Handle the case when there are no more levels
      Navigator.pop(context);
    }
  }
}