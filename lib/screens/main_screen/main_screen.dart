import 'package:flutter/material.dart';
import '../../widgets/coin_balance.dart';
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ethiopic Logo Quiz', style: TextStyle(fontWeight: FontWeight.w900)),
            CoinBalance(),
          ],
        ),
      ),
      body: GameList(logoCategories: logoCategories, svgPaths: svgPaths),
    );
  }
}