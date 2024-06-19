import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'package:flutter_application_lilyannsalon/widget/custom_textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String ID = "";
  String HP = "";
  String NAMA = "";
  String EMAIL = "";

  //init
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  //panggil data
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');

    if (userDataString != null) {
      final userData = UserData.fromJson(json.decode(userDataString));
      // print(userData.id);
      ID = userData.id.toString();
      HP = userData.nomor_hp;
      EMAIL = userData.email;
      NAMA = userData.name;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image.asset('assets/images/profil1.png'),
            Column(
              children: [
                SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Hi, ' + NAMA,
                    style: const TextStyle(
                      color: Color(0xFFB9798C), // Ganti warna teks menjadi biru
                      fontFamily:
                          'MontserratBold', // Atur gaya font menjadi bold
                      fontSize: 20, // Atur ukuran font menjadi 16
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: TextFormField(
            //readOnly: true,
            enabled: false,
            //initialValue: NAMA,
            decoration: InputDecoration(
                labelText: NAMA,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xFFB9798C),
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB9798C)))),
          ),
        ),
            Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: TextFormField(
            enabled: false,
            //readOnly: true, 
            initialValue: EMAIL,
            decoration: InputDecoration(
                labelText: EMAIL,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xFFB9798C),
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB9798C)))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: TextFormField(
            readOnly: true,
            enabled: false, 
            //initialValue: HP,
            decoration: InputDecoration(
                labelText: HP,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xFFB9798C),
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB9798C)))),
          ),
        ),

  
        
        SizedBox(height: 100),
        // Padding(
        //   padding: EdgeInsets.only(bottom: 25),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Color(0xFFB9798C),
        //       minimumSize: Size(280, 40),
        //     ),
        //     child: const Text(
        //       'SIMPAN',
        //       style: TextStyle(
        //         fontFamily:
        //             'MontserratBold', // Menggunakan font family MontserratBold
        //         color: Colors.white, // Mengubah warna teks menjadi putih
        //         fontSize: 18, // Sesuaikan ukuran font sesuai kebutuhan
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ));
  }
}