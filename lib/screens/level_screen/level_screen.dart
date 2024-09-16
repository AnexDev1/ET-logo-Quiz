import 'package:ethiopic_logo_quiz/controller/level_controller.dart';
import 'package:ethiopic_logo_quiz/screens/level_screen/view/answer_button.dart';
import 'package:ethiopic_logo_quiz/screens/level_screen/view/answer_field.dart';
import 'package:ethiopic_logo_quiz/screens/level_screen/view/question_field.dart';
import 'package:ethiopic_logo_quiz/provider/coin_balance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelScreen extends StatelessWidget {
  final String logoImagePath;
  final String answer;
  final String answerLogoImagePath;
  final VoidCallback onNextLevel;

  const LevelScreen({
    super.key,
    required this.logoImagePath,
    required this.answer,
    required this.answerLogoImagePath,
    required this.onNextLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LevelController(
        answer: answer,
        answerLogoImagePath: answerLogoImagePath,
        onCorrectAnswer: () {
          context.read<CoinBalanceProvider>().addCoins(25);
        },
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<CoinBalanceProvider>(
            builder: (context, coinBalance, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.monetization_on, color: Colors.yellow),
                  const SizedBox(width: 4),
                  Text('${coinBalance.coins}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text('Levels', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
              ),
              const SizedBox(height: 20),
              QuestionField(logoImagePath: logoImagePath),
              const SizedBox(height: 20),
              Consumer<LevelController>(
                builder: (context, controller, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.answer.length, (index) {
                      return GestureDetector(
                        onTap: () => controller.onInputFieldTap(index),
                        child: AnswerField(controller: controller, index: index),
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
                        onTap: () => controller.onLetterTap(letter, context, onNextLevel),
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