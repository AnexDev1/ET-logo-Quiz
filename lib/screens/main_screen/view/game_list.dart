import 'package:flutter/material.dart';
import '../../list_screen/view/level_grid.dart';

class GameList extends StatelessWidget {
  final List<String> logoCategories;

  const GameList({super.key, required this.logoCategories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: logoCategories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(logoCategories[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LevelGrid(category: logoCategories[index]),
              ),
            );
          },
        );
      },
    );
  }
}