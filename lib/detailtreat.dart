import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/bookForm.dart';

class TreatmentScreen extends StatefulWidget {
  final Map<String, dynamic> treatmentData;

  TreatmentScreen({required this.treatmentData});
  

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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    'https://2f90-203-29-27-130.ngrok-free.app/websem4/lilyansalon/public/${widget.treatmentData['image']}',
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  widget.treatmentData['nama_treatment'],
                  style: TextStyle(
                    fontFamily: 'MontserratBold',
                    fontSize: 24,
                    color: Color(0xFF944E63),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.treatmentData['harga'],
                  style: TextStyle(
                    fontFamily: 'MontserratBold',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.treatmentData['deskripsi'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookFormScreen(namaTreatment: widget.treatmentData['nama_treatment'], id_treatment:widget.treatmentData['id'], harga:widget.treatmentData['harga'])),
                );
              },
              child: Text(
                'BOOK NOW',
                style: TextStyle(
                  fontFamily: 'MontserratBold',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB9798C),
                minimumSize: Size(280, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}