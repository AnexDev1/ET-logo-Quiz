import 'package:ethiopic_logo_quiz/provider/coin_balance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/game_list.dart';

class MainScreen extends StatelessWidget {
  final List<String> logoCategories = [
    'Clothing Logos',
    'Food Logos',
    'Ethiopian Logos',
    'TVShow Logos',
    'Team Logos',
    'Other Logos',
  ];

  final List<String> svgPaths = [
    'assets/images/adidas.svg',
    'assets/images/kfc.svg',
    'assets/images/bank.svg',
    'assets/images/tv.svg',
    'assets/images/ft.svg',
    'assets/images/kfc.svg',
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Ethiopic Logo Quiz',
                style: TextStyle(fontWeight: FontWeight.w900)),
            Consumer<CoinBalanceProvider>(
              builder: (context, coinBalance, child) {
                return Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.yellow),
                    const SizedBox(width: 4),
                    Text('${coinBalance.coins}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: GameList(logoCategories: logoCategories, svgPaths: svgPaths),
    );
  }
}
