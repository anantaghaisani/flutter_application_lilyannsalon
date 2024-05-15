import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_lilyannsalon/bookForm.dart';
// import 'package:fluttercookie/bottom_bar.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key});

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Image.asset("assets/images/logoAppBar.png"),
        toolbarHeight: 65,
        // title: const Text ('Cbak home'),
      
    ),

      body: Column(
  children: [
    Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(20, 0, 20,20),
        children: [
          Image.asset(
            'assets/images/carousel3.jpg', 
            height: 260,
            width: double.infinity, 
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 13),
          Text(
            'Potong Cuci Blow',
            style: TextStyle(
              fontFamily: 'MontserratBold',
              fontSize: 24,
              color: Color(0xFF944E63),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Rp. 200.000',
            style: TextStyle(
              fontFamily: 'MontserratBold',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Smoothing adalah proses perawatan rambut yang bertujuan untuk membuat rambut tampak lebih lurus, halus, dan berkilau. Proses ini biasanya dilakukan untuk mengurangi kerutan, kusut, dan kekeringan pada rambut, sehingga memberikan tampilan yang lebih rapi dan teratur.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ), // Spacer antara ListView dan tombol
    Padding(
      padding: EdgeInsets.only(bottom: 25),
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookFormScreen()),);
          },
      child: Text(
            'BOOK NOW',
            style: TextStyle(
              fontFamily: 'MontserratBold', // Menggunakan font family MontserratBold
              color: Colors.white, // Mengubah warna teks menjadi putih
              fontSize: 18, // Sesuaikan ukuran font sesuai kebutuhan
            ),
          ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB9798C), // Atur warna latar belakang
        minimumSize: Size(280, 40), // Atur lebar tombol menjadi full width dan tinggi 65
      ),
    ),
    ),
  ],
),



    );
  }
}