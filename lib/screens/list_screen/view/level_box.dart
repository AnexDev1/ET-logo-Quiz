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
    final String categoryKey = category.split(' ')[0].toLowerCase();
    final String logoImagePath =
        'assets/images/$categoryKey/logo_${index + 1}.png';
    final String answerLogoImagePath =
        'assets/images/$categoryKey/logo_${index + 1}_ans.png';

    // Retrieve the answers for the current category
    final answers =
        context.read<CategoryAnswersProvider>().getAnswers(category);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LevelScreen(
              logoImagePath: logoImagePath,
              answer: answers[index], // Pass the correct answer
              answerLogoImagePath: answerLogoImagePath,
              onNextLevel: () {
                _navigateToNextLevel(context, categoryKey, index + 1, answers);
              },
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Display the logo image
              Image.asset(
                logoImagePath,
                fit: BoxFit.contain,
                height: 120, // Fixed height for uniformity
                width: double.infinity,
              ),
              // Removed the overlay with text
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextLevel(BuildContext context, String categoryKey,
      int nextIndex, List<String> answers) {
    if (nextIndex < answers.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LevelScreen(
            logoImagePath:
                'assets/images/$categoryKey/logo_${nextIndex + 1}.png',
            answer: answers[nextIndex],
            answerLogoImagePath:
                'assets/images/$categoryKey/logo_${nextIndex + 1}_ans.png',
            onNextLevel: () {
              _navigateToNextLevel(
                  context, categoryKey, nextIndex + 1, answers);
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
