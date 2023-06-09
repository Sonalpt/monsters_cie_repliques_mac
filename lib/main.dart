import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import './screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(
        navigateToScreen: WelcomeScreen(),
        delay: Duration(seconds: 2),
      ),
    );
  }
}
