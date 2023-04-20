// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import './welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  final Widget navigateToScreen;
  final Duration delay;

  const SplashScreen({
    required this.navigateToScreen,
    required this.delay,
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(widget.delay, () {
      // Rediriger l'utilisateur vers la page principale après le délai spécifié
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration:
              const Duration(milliseconds: 500), // durée de la transition
          pageBuilder: (_, __, ___) =>
              widget.navigateToScreen, // destination de la transition
          transitionsBuilder:
              (_, animation, __, child) => // builder de la transition
                  FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF1B032C), // Couleur de fond de l'écran de démarrage
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/splash_screen.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Monstres",
                            style: TextStyle(
                              color: Color(0xFF508FFF),
                              fontSize: 50,
                              fontFamily: 'MonstersInc-2zO3',
                            ),
                          ),
                          TextSpan(
                            text: " & ",
                            style: TextStyle(
                              color: Color(0xFF508FFF),
                              fontSize: 20,
                              fontFamily: 'sans-serif',
                            ),
                          ),
                          TextSpan(
                            text: "cie",
                            style: TextStyle(
                              color: Color(0xFF508FFF),
                              fontSize: 50,
                              fontFamily: 'MonstersInc-2zO3',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "les repliques",
                      style: TextStyle(
                        color: Color(0xFF5AFF4A),
                        fontSize: 50,
                        fontFamily: 'MonstersInc-2zO3',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
