import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/category_answer_provider.dart';
import 'level_box.dart';

class LevelGrid extends StatelessWidget {
  final String category;

  const LevelGrid({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final answers = context.read<CategoryAnswersProvider>().getAnswers(category);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: answers.length, // Number of items based on answers length
      itemBuilder: (context, index) {
        return LevelBox(index: index, category: category);
      },
    );
  }
}