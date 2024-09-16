import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoinBalanceProvider extends ChangeNotifier {
  int _coins = 0;
  static const String _coinKey = 'coin_balance';

  CoinBalanceProvider() {
    loadCoins();
  }

  int get coins => _coins;

  Future<void> loadCoins() async {
    final prefs = await SharedPreferences.getInstance();
    _coins = prefs.getInt(_coinKey) ?? 0;
    notifyListeners();
  }

  Future<void> _saveCoins() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_coinKey, _coins);
  }

  void addCoins(int amount) {
    _coins += amount;
    _saveCoins();
    notifyListeners();
  }

  bool deductCoins(int amount) {
    if (_coins >= amount) {
      _coins -= amount;
      _saveCoins();
      notifyListeners();
      return true;
    }
    return false;
  }

  void resetCoins() {
    _coins = 0;
    _saveCoins();
    notifyListeners();
  }
}
