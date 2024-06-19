import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_lilyannsalon/home.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_lilyannsalon/widget/appTab.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> listJam = <String>[
  '07:00-08:00',
  '09:00-10:00',
  '11:00-12:00',
  '13:00-14:00',
  '15:00-16:00',
  '17:00-18:00',
];

const List<String> listService = <String>[
  'Home Service',
  'Salon Service',
];

const List<String> listDistric = <String>[
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
  final String namaTreatment;
  final String id_treatment;
  final String harga;

  const BookFormScreen({Key? key, required this.namaTreatment, required this.id_treatment, required this.harga})
      : super(key: key);

  @override
  State<BookFormScreen> createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  // final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _kecamatanController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  String? jamValue;
  String? serviceValue;
  int akomodasi = 0;
  String? kecamatanValue;
  final now = DateTime.now();
  String ID = "";
  double total = 0.0;
  int total_akhir =0;


 double calculateTotal() {
  double harga2 = double.parse(widget.harga); // Access widget.harga here
  
  total = akomodasi + harga2;
  total_akhir = total.round();
  print(total);
  print(total_akhir);
  return total;
  
}



  //init
  @override
  void initState() {
    super.initState();
    loadUserData();
    calculateTotal();
  }

  //panggil data
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');

    if (userDataString != null) {
      final userData = UserData.fromJson(json.decode(userDataString));
      // print(userData.id);
      ID = userData.id.toString();
      
      setState(() {});
    }
  }


showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
    Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Image.network('https://i.pinimg.com/originals/60/c2/4c/60c24cb5c5cd7973b0028dfbe1d273a1.gif'),
    content:  Text("Jadwal Tidak Di Temukan!!", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}







  Future<void> submitbook() async {
    final url =
        Uri.parse('https://2f90-203-29-27-130.ngrok-free.app/api/booking');

    final response = await http.post(
      url,
      body: {
        'tanggal': _dateController.text,
        'jam': jamValue,
        'service': serviceValue,
        'kecamatan': kecamatanValue,
        'alamat': _alamatController.text,
        'akomodasi': akomodasi.toString(),
        'status': 'belum bayar',
        'nama_treatment': widget.namaTreatment,
        'customer_id': ID,
        'menu_id': widget.id_treatment,
        'created_at': now.toString(),
        'updated_at': now.toString()
      },
    );

    if (response.statusCode == 200) {
        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sideBar()),
                      );
      // Handle the success response here
      print(response.body);
    }
    else if(response.statusCode == 400){
      print('object');
      
showAlertDialog(context);


    
    } 
    
    
    else {
      // Handle the error response here
      print('Gagal mengirim data. Status code: ${response.statusCode}');
    }
  }

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
                      onTap: () {
                        _selectedDate();
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  // DropdownButtonWaktu(),
                  DropdownButton<String>(
                    isExpanded:
                        true, // Membuat zDropdownButton menempati sebanyak mungkin ruang horizontal
                    padding: EdgeInsets.only(left: 14, right: 14),

                    value: jamValue, // Ganti nilai menjadi null
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
                        jamValue = value;
                      });
                    },
                    items: listJam.map<DropdownMenuItem<String>>((String jam) {
                      return DropdownMenuItem<String>(
                        value: jam,
                        child: Text(jam),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 10),
                  // dropDownService(),
                  DropdownButton<String>(
                    isExpanded:
                        true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
                    padding: EdgeInsets.only(left: 14, right: 14),
                    value: serviceValue, // Ganti nilai menjadi null
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
                    onChanged: (String? serviceValue1) {

                      // This is called when the user selects an item.
                      setState(() {
                        serviceValue = serviceValue1;
                        if (serviceValue == 'Home Service') {
        akomodasi = 25000;
      } else if (serviceValue == 'Salon Service') {
        akomodasi = 0; // You mentioned it should be 0 for Salon Service
      }
      calculateTotal();

                      });
                    },
                    items: listService
                        .map<DropdownMenuItem<String>>((String serviceValue) {
                      return DropdownMenuItem<String>(
                        value: serviceValue,
                        child: Text(serviceValue),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 15),
                  Text(
                    "Alamat",
                    style: TextStyle(
                      fontFamily: 'MontserratBold',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  // dropDownDistrict(),

                  DropdownButton<String>(
                    isExpanded:
                        true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
                    padding: EdgeInsets.only(left: 14, right: 14),
                    value: kecamatanValue, // Ganti nilai menjadi null
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
                    onChanged: (String? kecamatanValue1) {
                      // This is called when the user selects an item.
                      setState(() {
                        kecamatanValue = kecamatanValue1;
                      });
                    },
                    items: listDistric
                        .map<DropdownMenuItem<String>>((String kecamatanValue) {
                      return DropdownMenuItem<String>(
                        value: kecamatanValue,
                        child: Text(kecamatanValue),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: TextField(
                      controller: _alamatController,
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
                        labelText: widget.namaTreatment,
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
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
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Akomodasi               : $akomodasi',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'PoppinsSemiBold'),
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Treatment                :' + widget.harga,
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'PoppinsSemiBold'),
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Estimasi Total          :' + total_akhir.toString() ,
                      style: TextStyle(fontSize: 14, fontFamily: 'PoppinsBold'),
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      submitbook();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => sideBar()),
                      // );
                    },
                    child: Text(
                      'CONFIRM BOOK',
                      style: TextStyle(
                        fontFamily:
                            'MontserratBold', // Menggunakan font family MontserratBold
                        color:
                            Colors.white, // Mengubah warna teks menjadi putih
                        fontSize: 18, // Sesuaikan ukuran font sesuai kebutuhan
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFFB9798C), // Atur warna latar belakang
                      minimumSize: Size(320,
                          40), // Atur lebar tombol menjadi full width dan tinggi 65
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
  }
}

// class DropdownButtonWaktu extends StatefulWidget {
//   const DropdownButtonWaktu({Key? key}) : super(key: key);

//   @override
//   State<DropdownButtonWaktu> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonWaktu> {
// String? dropdownValue; // Ubah menjadi nullable

// @override
// Widget build(BuildContext context) {
// return DropdownButton<String>(

//   isExpanded:
//       true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
//   padding: EdgeInsets.only(left: 14, right: 14),

//   value: dropdownValue, // Ganti nilai menjadi null
//   hint: Text('Pilih Jam'), // Tambahkan hint
//   icon: Icon(
//     Icons.arrow_drop_down_rounded,
//     color: Color(0xFF944E63),
//   ),
//   iconSize: 24, // Atur ukuran ikon sesuai kebutuhan
//   iconEnabledColor: Color(0xFF944E63), // Atur warna ikon
//   elevation: 25,
//   style: TextStyle(
//     color: Colors.black,
//     fontWeight: FontWeight.w400,
//     fontSize: 16.5,
//   ),
//   underline: Container(
//     height: 2,
//     color: Color(0xFF944E63),
//   ),
//   onChanged: (String? value) {
//     // This is called when the user selects an item.
//     setState(() {
//       value = value;
//     });
//   },
//   items: listJam.map<DropdownMenuItem<String>>((String jam) {
//     return DropdownMenuItem<String>(
//       value: jam,
//       child: Text(jam),
//     );
//   }).toList(),
// );
// }
// }

// class dropDownService extends StatefulWidget {
//   const dropDownService({super.key});

//   @override
//   State<dropDownService> createState() => _dropDownServiceState();
// }

// class _dropDownServiceState extends State<dropDownService> {
// String? dropdownValue;
// @override
// Widget build(BuildContext context) {
//  return
//  DropdownButton<String>(
//   isExpanded:
//       true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
//   padding: EdgeInsets.only(left: 14, right: 14),
//   value: dropdownValue, // Ganti nilai menjadi null
//   hint: Text('Service'), // Tambahkan hint
//   icon: Icon(
//     Icons.arrow_drop_down_rounded,
//     color: Color(0xFF944E63),
//   ),
//   iconSize: 24, // Atur ukuran ikon sesuai kebutuhan
//   iconEnabledColor: Color(0xFF944E63), // Atur warna ikon
//   elevation: 25,
//   style: TextStyle(
//     color: Colors.black,
//     fontWeight: FontWeight.w400,
//     fontSize: 16.5,
//   ),
//   underline: Container(
//     height: 2,
//     color: Color(0xFF944E63),
//   ),
//   onChanged: (String? value) {
//     // This is called when the user selects an item.
//     setState(() {
//       dropdownValue = value;
//     });
//   },
//   items: listService.map<DropdownMenuItem<String>>((String service) {
//     return DropdownMenuItem<String>(
//       value: service,
//       child: Text(service),
//     );
//   }).toList(),
// ),
// }
// }

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
      isExpanded:
          true, // Membuat DropdownButton menempati sebanyak mungkin ruang horizontal
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
      items: listDistric.map<DropdownMenuItem<String>>((String kecamatan) {
        return DropdownMenuItem<String>(
          value: kecamatan,
          child: Text(kecamatan),
        );
      }).toList(),
    );
  }
}