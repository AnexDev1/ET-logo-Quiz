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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListScreen(category: logoCategories[index]),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SvgPicture.asset(
                svgPath,
                height: 60, // Set the height of the SVG image
                width: 60, // Set the width of the SVG image
              ),
              const SizedBox(
                  width: 16), // Add some space between the image and the text
              Expanded(
                child: Text(
                  logoCategories[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
