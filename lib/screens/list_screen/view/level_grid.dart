
import 'package:ethiopic_logo_quiz/screens/list_screen/view/level_box.dart';
import 'package:flutter/material.dart';


class LevelGrid extends StatelessWidget {
  const LevelGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 10, // Number of items
      itemBuilder: (context, index) {
        return LevelBox(index:index);
      },
    );
  }
}

