import 'package:flutter/material.dart';

class CoinBalanceProvider extends ChangeNotifier {
  int _coins = 0;

  int get coins => _coins;

  void addCoins(int amount) {
    _coins += amount;
    notifyListeners();
  }

  void resetCoins() {
    _coins = 0;
    notifyListeners();
  }
}