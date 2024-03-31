import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF944E63),
        ),
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Image.asset("assets/images/logo_splash.png"),
        ),
      ),
      ),
    );
  }
}