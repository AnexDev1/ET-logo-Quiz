import 'package:flutter/material.dart';
import 'level_box.dart';

class LevelGrid extends StatelessWidget {
  final String category;

  const LevelGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 1, // Number of items
      itemBuilder: (context, index) {
        return LevelBox(index: index, category: category);
      },
    );
  }
}