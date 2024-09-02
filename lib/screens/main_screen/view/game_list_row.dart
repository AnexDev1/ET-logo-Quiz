import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../list_screen/list_screen.dart';

class GameListRow extends StatelessWidget {
  const GameListRow({
    super.key,
    required this.logoCategories,
    required this.index,
    required this.svgPath,
  });

  final List<String> logoCategories;
  final int index;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        height: 70, // Set the height of the ListTile
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              height: 40, // Set the height of the SVG image
              width: 40,  // Set the width of the SVG image
            ),
            const SizedBox(width: 16), // Add some space between the image and the text
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                logoCategories[index],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigate to the respective logo category screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListScreen(category: logoCategories[index]),
          ),
        );
      },
    );
  }
}