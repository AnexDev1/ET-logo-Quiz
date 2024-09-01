import 'package:flutter/material.dart';

import '../../list_screen/list_screen.dart';

class GameListRow extends StatelessWidget {
  const GameListRow({
    super.key,
    required this.logoCategories,
    required this.index
  });

  final List<String> logoCategories;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        height: 70, // Set the height of the ListTile
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            logoCategories[index],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        // Navigate to the respective logo category screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ListScreen(category: logoCategories[index]),
          ),
        );
      },
    );
  }
}