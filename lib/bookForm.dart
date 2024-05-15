import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_lilyannsalon/book.dart';
import 'package:flutter_application_lilyannsalon/widget/appTab.dart';

const List<String> listJam= <String>[
  '07:00-08:00', 
  '09:00-10:00', 
  '11:00-12:00', 
  '13:00-14:00', 
  '15:00-16:00',
  '17:00-18:00',
  ];

const List<String> listService= <String>[
  'Home Service', 
  'Salon Service', 
  ];

const List<String> listDistric= <String>[
  'Ajung', 
  'Ambulu', 
  'Arjasa', 
  'Balung', 
  'Bangsalsari', 
  'Jelbuk', 
  'Jenggawah', 
  'Jombang', 
  'Kalisat', 
  'Kencong', 
  'Ledokombo', 
  'Mayang', 
  'Mumbulsari', 
  'Pakusari', 
  'Panti', 
  'Patrang', 
  'Puger', 
  'Rambipuji', 
  'Semboro', 
  'Silo', 
  'Sukorambi', 
  'Sukowono', 
  'Sumberbaru', 
  'Sumberjambe', 
  'Sumbersari', 
  'Tanggul', 
  'Tempurejo', 
  'Umbulsari', 
  'Wuluhan',
];

class BookFormScreen extends StatefulWidget {
  const BookFormScreen({super.key});

void main() => runApp(const BookFormScreen());
  @override
  State<BookFormScreen> createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {

  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Image.asset("assets/images/logoAppBar.png"),
        toolbarHeight: 65,
        // title: const Text ('Cbak home'),
      
    ),
      body: Container(
  child: Column(
    children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              "Booking Detail",
              style: TextStyle(
                fontFamily: 'MontserratBold',
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  hintText: 'Pilih Hari',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF944E63),
                      width: 2, 
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF944E63),
                      width: 2, 
                    ),
                  ),
                ),
                readOnly: true,
                onTap: (){
                  _selectedDate();
                },
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonWaktu(),
            SizedBox(height: 10),
            dropDownService(),
            SizedBox(height: 15),
            Text(
              "Alamat",
              style: TextStyle(
                fontFamily: 'MontserratBold',
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            dropDownDistrict(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: TextField(
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: 'Alamat Lengkap',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF944E63),
                      width: 2, 
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF944E63),
                      width: 2, 
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Pilihan Treatment",
              style: TextStyle(
                fontFamily: 'MontserratBold',
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: TextField( 
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'SMOOTHING',
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF944E63),
                      width: 2, 
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF944E63),
                      width: 2, 
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Column(
  children: [
    Divider(),
      Padding(
        padding: const EdgeInsets.only(bottom:  5),
        child: Text('Akomodasi               : 25.000',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'PoppinsSemiBold'
        ),)
        ),
      Padding(
        padding: const EdgeInsets.only(bottom:  5),
        child: Text('Treatment                : 200.000',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'PoppinsSemiBold'
        ),)
        ),
      Padding(
        padding: const EdgeInsets.only(bottom:  10),
        child: Text('Estimasi Total          : 225.000',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'PoppinsBold'
        ),)
        ),
      Padding(
      padding: EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
          onPressed: () {
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => sideBar()
          ),
          );
          },
      child: Text(
            'CONFIRM BOOK',
            style: TextStyle(
              fontFamily: 'MontserratBold', // Menggunakan font family MontserratBold
              color: Colors.white, // Mengubah warna teks menjadi putih
              fontSize: 18, // Sesuaikan ukuran font sesuai kebutuhan
            ),
          ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB9798C), // Atur warna latar belakang
        minimumSize: Size(320, 40), // Atur lebar tombol menjadi full width dan tinggi 65
      ),
    ),
    ),
    ],
  ),],
),),);
  }
  Future<void> _selectedDate() async {
    DateTime? _picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100));
      
      if (_picked != null) {
        setState(() {
          _dateController.text = _picked.toString().split(" ")[0];
        });
  }
  }}

class DropdownButtonWaktu extends StatefulWidget {
  const DropdownButtonWaktu({Key? key}) : super(key: key);

  @override
  State<DropdownButtonWaktu> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonWaktu> {
  String? dropdownValue; // Ubah menjadi nullable

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        isExpanded: true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
        padding: EdgeInsets.only(left: 14, right: 14),
        value: dropdownValue, // Ganti nilai menjadi null
        hint: Text('Pilih Jam'), // Tambahkan hint
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Color(0xFF944E63),
        ),
        iconSize: 24, // Atur ukuran ikon sesuai kebutuhan
        iconEnabledColor: Color(0xFF944E63), // Atur warna ikon
        elevation: 25,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16.5,
        ),
        underline: Container(
          height: 2,
          color: Color(0xFF944E63),
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value;
          });
        },
        items: listJam.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
        }}

class dropDownService extends StatefulWidget {
  const dropDownService({super.key});

  @override
  State<dropDownService> createState() => _dropDownServiceState();
}

class _dropDownServiceState extends State<dropDownService> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        isExpanded: true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
        padding: EdgeInsets.only(left: 14, right: 14),
        value: dropdownValue, // Ganti nilai menjadi null
        hint: Text('Service'), // Tambahkan hint
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Color(0xFF944E63),
        ),
        iconSize: 24, // Atur ukuran ikon sesuai kebutuhan
        iconEnabledColor: Color(0xFF944E63), // Atur warna ikon
        elevation: 25,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16.5,
        ),
        underline: Container(
          height: 2,
          color: Color(0xFF944E63),
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value;
          });
        },
        items: listService.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
        }}
class dropDownDistrict extends StatefulWidget {
  const dropDownDistrict({super.key});

  @override
  State<dropDownDistrict> createState() => _dropDownDistrictState();
}

class _dropDownDistrictState extends State<dropDownDistrict> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        isExpanded: true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
        padding: EdgeInsets.only(left: 14, right: 14),
        value: dropdownValue, // Ganti nilai menjadi null
        hint: Text('Kecamatan'), // Tambahkan hint
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Color(0xFF944E63),
        ),
        iconSize: 24, // Atur ukuran ikon sesuai kebutuhan
        iconEnabledColor: Color(0xFF944E63), // Atur warna ikon
        elevation: 25,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16.5,
        ),
        underline: Container(
          height: 2,
          color: Color(0xFF944E63),
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value;
          });
        },
        items: listDistric.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
        }}