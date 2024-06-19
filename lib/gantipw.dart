import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/berhasil.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';

import 'package:flutter_application_lilyannsalon/theme.dart';
import 'package:flutter_application_lilyannsalon/widget/custom_textformfield.dart';
import 'package:flutter_application_lilyannsalon/widget/primary_button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Gantipw extends StatefulWidget {
  @override
  State<Gantipw> createState() => _GantipwState();
}

class _GantipwState extends State<Gantipw> {
  final TextEditingController passwordController = TextEditingController();


  String id = "";

@override
  void initState() {
    super.initState();
    loadUserData();
  }
  

    Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');

    if (userDataString != null) {
      final userData = UserData.fromJson(json.decode(userDataString));
      // print(userData.id);
      id = userData.id.toString();
      
      setState(() {});
    }
  }

  Future<void> _gantiPassword(BuildContext context) async {
    await loadUserData();
    final newPassword = passwordController.text;

    // Data yang akan dikirimkan dalam body request
    final url =
        Uri.parse('https://2f90-203-29-27-130.ngrok-free.app/api/reset/'+ id );

    final response = await http.post(
      url,
      body: {
        'password': newPassword,
       
      },
    );

    if (response.statusCode == 200) {
      // Password berhasil diubah
      print('Password berhasil diubah');
      print(response.body);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Berhasil(),));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => LogInScreen()),
      // );
    } else {
      // Gagal mengubah password
      print('Gagal mengubah password. Status code: $Exception');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 250),
            Text('Ganti Password', style: titleText),
            const SizedBox(height: 5),
            Text('Masukkan password baru', style: subTitle.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            CustomTextField(textEditingController: passwordController, textLabel: "Password Baru", pass: false),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                _gantiPassword(context);
              },
              child: PrimaryButton(buttonText: 'Ganti Password'),
            ),
          ],
        ),
      ),
    );
  }
}