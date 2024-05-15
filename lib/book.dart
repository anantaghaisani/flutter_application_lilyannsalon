import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Enih Daftar Book... Cooming Soon")),
    );
  }
}
class gridBook extends StatefulWidget {
  const gridBook({super.key});

  @override
  State<gridBook> createState() => _gridBookState();
}

class _gridBookState extends State<gridBook> {
  final List<Map<String, dynamic>> listBook = [
    {"Id": "912319312301312"}
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}