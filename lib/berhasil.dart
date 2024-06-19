import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/login.dart';
import 'package:flutter_application_lilyannsalon/profileTap.dart';

class Berhasil extends StatefulWidget {
  const Berhasil({super.key});

  @override
  State<Berhasil> createState() => _BerhasilState();
}

class _BerhasilState extends State<Berhasil> {
   bool _showSpinner = false;

  @override
  void initState() {
    super.initState();

    // Tampilkan spinner setelah 2 detik
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _showSpinner = true;
      });
    });

    // Arahkan ke halaman LoginPage setelah 8 detik
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         Center(
          child: Image.network('https://i.pinimg.com/originals/71/3a/32/713a3272124cc57ba9e9fb7f59e9ab3b.gif'),
         ),
          if (_showSpinner)
            const Padding(
              padding: const EdgeInsets.only(top: 120.0), // Atur jarak bawah
              child: Align(
                child: CircularProgressIndicator(), // Tampilkan spinner
              ),
            ),
        ],
      ),
    );
  }
}