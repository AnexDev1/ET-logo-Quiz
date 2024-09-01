// lib/screens/level_screen.dart
import 'package:ethiopic_logo_quiz/controller/level_controller.dart';
import 'package:ethiopic_logo_quiz/screens/level_screen/view/answer_button.dart';
import 'package:ethiopic_logo_quiz/screens/level_screen/view/answer_field.dart';
import 'package:ethiopic_logo_quiz/screens/level_screen/view/question_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelScreen extends StatelessWidget {
  final String logoImagePath;
  final String answer;
  final String answerLogoImagePath;

  const LevelScreen({
    super.key,
    required this.logoImagePath,
    required this.answer,
    required this.answerLogoImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LevelController(answer: answer, answerLogoImagePath: answerLogoImagePath),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Level Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              QuestionField(logoImagePath: logoImagePath),
              const SizedBox(height: 20),
              Consumer<LevelController>(
                builder: (context, controller, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.answer.length, (index) {
                      return GestureDetector(
                        onTap: () => controller.onInputFieldTap(index),
                        child: AnswerField(controller:controller,index:index),
                      );
                    }),
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer<LevelController>(
                builder: (context, controller, child) {
                  return Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: controller.availableLetters.map((letter) {
                      return GestureDetector(
                        onTap: () => controller.onLetterTap(letter, context),
                        child: AnswerButton(letter),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}





