import 'package:flutter/material.dart';

import '../../list_screen/list_screen.dart';
import 'game_list_row.dart';

class GameList extends StatelessWidget {
  const GameList({
    super.key,
    required this.logoCategories,
  });

  final List<String> logoCategories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:10.0),
      child: ListView.builder(
        itemCount: logoCategories.length,
        itemBuilder: (context, index) {
          return GameListRow(logoCategories: logoCategories,index:index);
        },
      ),
    );
  }
}

