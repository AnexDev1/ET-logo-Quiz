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

    // Map of categories to their respective lists of answers
    final Map<String, List<String>> categoryAnswers = {
      'clothing': ['adidas', 'levis', 'vans', 'chanel'],
      'food': ['kfc', 'mcdonalds', 'burgerking', 'subway'],
      'bank': ['chase', 'wellsfargo', 'citi', 'boa'],
      'tvshow': ['friends', 'breakingbad', 'got', 'strangerthings'],
      'team': ['lakers', 'warriors', 'yankees', 'dodgers'],
      'other': ['apple', 'google', 'microsoft', 'amazon'],
    };

    // Get the correct list of answers based on the category
    final List<String> answers = categoryAnswers[categoryKey] ?? [];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LevelScreen(
              logoImagePath: logoImagePath,
              answer: answers[index],
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