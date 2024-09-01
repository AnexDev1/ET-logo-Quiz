// lib/screens/list_screen.dart
import 'package:ethiopic_logo_quiz/screens/level_screen/level_screen.dart';
import 'package:ethiopic_logo_quiz/screens/list_screen/view/level_grid.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final String category;

  const ListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: LevelGrid(),
      ),
    );
  }
}
