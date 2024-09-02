import 'package:flutter/material.dart';

class CategoryAnswersProvider with ChangeNotifier {
  final Map<String, List<String>> _categoryAnswers = {
    'clothing': ['adidas', 'levis', 'vans', 'chanel'],
    'food': ['kfc', 'mcdonalds', 'burgerking', 'subway'],
    'ethiopian': ['chase', 'wellsfargo', 'citi', 'boa'],
    'tvshow': ['friends', 'breakingbad', 'got', 'strangerthings'],
    'team': ['lakers', 'warriors', 'yankees', 'dodgers'],
    'other': ['apple', 'google', 'microsoft', 'amazon'],
  };

  List<String> getAnswers(String category) {
    final String categoryKey = category.split(' ')[0].toLowerCase();
    return _categoryAnswers[categoryKey] ?? [];
  }
}