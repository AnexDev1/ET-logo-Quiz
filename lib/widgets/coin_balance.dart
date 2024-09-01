import 'package:flutter/material.dart';

class CoinBalance extends StatelessWidget {
  const CoinBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.monetization_on, color: Colors.white,size: 20,),
          SizedBox(width: 4.0),
          Text(
            '100', // Example coin amount
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}