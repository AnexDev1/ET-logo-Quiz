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
      child: Consumer<LevelController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: AppBar(
              title: Consumer<CoinBalanceProvider>(
                builder: (context, coinBalance, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text('${coinBalance.coins}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  );
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Levels',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                  const SizedBox(height: 20),
                  QuestionField(logoImagePath: logoImagePath),
                  const SizedBox(height: 10),
                  Consumer<CoinBalanceProvider>(
                    builder: (context, coinBalance, child) {
                      return GestureDetector(
                        onTap: () {
                          if (controller.getHint(context)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Hint used! 5 coins deducted.')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Not enough coins for a hint!')),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lightbulb,
                              color: coinBalance.coins >= 5
                                  ? Colors.yellow
                                  : Colors.grey,
                              size: 30,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '5',
                              style: TextStyle(
                                color: coinBalance.coins >= 5
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.answer.length, (index) {
                      return AnswerField(controller: controller, index: index);
                    }),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: controller.availableLetters.map((letter) {
                      return GestureDetector(
                        onTap: () => controller.onLetterTap(
                            letter, context, onNextLevel),
                        child: AnswerButton(letter),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
