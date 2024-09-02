import 'package:flutter/material.dart';
import 'game_list_row.dart';

class GameList extends StatelessWidget {
  final List<String> logoCategories;
  final List<String> svgPaths;

  const GameList({super.key, required this.logoCategories, required this.svgPaths});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: logoCategories.length,
      itemBuilder: (context, index) {
        return GameListRow(
          logoCategories: logoCategories,
          index: index,
          svgPath: svgPaths[index],
        );
      },
    );
  }
}