import 'package:flutter/material.dart';

const List<String> listPertanyaan= <String>[
  'Apa nama panggilan masa kecil Anda?', 
  'Apa nama sekolah dasar Anda?', 
  'Apa nama hewan peliharaan pertama Anda?', 
  'Siapa nama sahabat terbaik Anda saat kecil?', 
  'Apa nama tengah ibu Anda?',
  'Apa judul film favorit Anda?',
  ];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nama = TextEditingController(text: "Ananta Ghaisani");
  final TextEditingController _telephone = TextEditingController(text: "085165165616");
  final TextEditingController _jawaban = TextEditingController(text: "Barbie");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // Background Image
              Image.asset(
                "assets/images/profileback.png",
                width: double.maxFinite,
                height: 180,
                fit: BoxFit.cover,
              ),
              // Text Widget
              Positioned(
                bottom: 20.0, // Adjust the position of the text
                left: 20.0, // Adjust the position of the text
                child: Text(
                  'Hi, Ananta Ghaisani!',
                  style: TextStyle(
                    fontFamily: 'MontserratBold',
                    color: Color(0xFF643543),
                    fontSize: 26.0,
                  ),
                ),
              ),
            ],
          ),
          // Text Field
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: TextField(
              controller: _nama,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                labelText: 'Nama',
                labelStyle: TextStyle(color: Color(0xFF944E63)),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: TextField(
              controller: _telephone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                labelText: 'No. Telephone',
                labelStyle: TextStyle(color: Color(0xFF944E63)),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                ),
            ),
          ),
          SizedBox(height: 20),
          dropDownPertanyaan(),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: TextField(
              controller: _jawaban,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF944E63)),
                ),
                labelText: 'Jawaban',
                labelStyle: TextStyle(color: Color(0xFF944E63)),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                ),
            ),
          ),
          Padding(
      padding: EdgeInsets.fromLTRB(40,20,40,20),
          child: ElevatedButton(
          onPressed: () {},
      child: Text(
            'SIMPAN',
            style: TextStyle(
              fontFamily: 'MontserratBold', // Menggunakan font family MontserratBold
              color: Colors.white, // Mengubah warna teks menjadi putih
              fontSize: 18, // Sesuaikan ukuran font sesuai kebutuhan
            ),
          ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB9798C), // Atur warna latar belakang // Atur lebar tombol menjadi full width dan tinggi 65
      ),
    ),
    ),
        ],
      ),
    );
  }
}
class dropDownPertanyaan extends StatefulWidget {
  const dropDownPertanyaan({Key? key}) : super(key: key);

  @override
  State<dropDownPertanyaan> createState() => _dropDownPertanyaanState();
}

class _dropDownPertanyaanState extends State<dropDownPertanyaan> {
  String? dropdownValue = 'Apa nama panggilan masa kecil Anda?';

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: InputDecorator(
        decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF944E63)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF944E63)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF944E63)),
      ),
      labelText: 'Pertanyaan Keamanan',
      labelStyle: TextStyle(color: Color(0xFF944E63)),
        ),
        child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        hint: Text('Pilih Pertanyaan'),
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Color(0xFF944E63),
        ),
        iconSize: 24,
        iconEnabledColor: Color(0xFF944E63),
        elevation: 5,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16.5,
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value;
          });
        },
        items: listPertanyaan.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
        ),
      ),
    );}}