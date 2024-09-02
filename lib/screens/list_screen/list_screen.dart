// lib/screens/list_screen.dart
import 'package:ethiopic_logo_quiz/screens/list_screen/view/level_grid.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final String category;

  const ListScreen({super.key, required this.category});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LevelGrid(category: widget.category,),
      ),
    );
  }
}
