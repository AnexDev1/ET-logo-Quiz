import 'package:ethiopic_logo_quiz/screens/list_screen/list_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/coin_balance.dart';
import 'view/game_list.dart';

class MainScreen extends StatelessWidget {
  final List<String> logoCategories = [
    'Clothing Logos',
    'Food Logos',
    'Bank Logos',
    'TVShow Logos',
    'Team Logos',
    'Other Logos',
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ethiopic Logo Quiz', style: TextStyle(fontWeight: FontWeight.w900)),
            CoinBalance(),
          ],
        ),
      ),
      body: GameList(logoCategories: logoCategories),
    );
  }
}