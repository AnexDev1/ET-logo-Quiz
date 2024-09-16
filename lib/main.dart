import 'package:ethiopic_logo_quiz/provider/coin_balance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final coinBalanceProvider = CoinBalanceProvider();
  await coinBalanceProvider
      .loadCoins(); // Ensure coins are loaded before the app starts

  runApp(
    ChangeNotifierProvider.value(
      value: coinBalanceProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ethiopic Logo Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
