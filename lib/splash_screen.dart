import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_application_lilyannsalon/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      // Membuat timer dengan jangka waktu 2 detik
      Timer(const Duration(seconds: 2), () {
        // Pindah ke tampilan selanjutnya (contoh: MyHomePage)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => LogInScreen(),
          ),
        );
      });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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