import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/gantipw.dart';
import 'package:flutter_application_lilyannsalon/login.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'package:flutter_application_lilyannsalon/profileTap.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_lilyannsalon/theme.dart';
import 'package:flutter_application_lilyannsalon/widget/custom_textformfield.dart';
import 'package:flutter_application_lilyannsalon/widget/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_application_lilyannsalon/widget/reset_form.dart';

class ResetPasswordScreen extends StatefulWidget {

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController email_Controller = TextEditingController();

  // final TextEditingController password_Controller = TextEditingController();
    final TextEditingController nomor_Controller = TextEditingController();

late UserData userData;

      @override
  void initState() {

    // Periksa apakah token akses sudah ada
  }

  Future<void> _reset() async {
    String email = email_Controller.text;
    String nomor = nomor_Controller.text;

    // Membuat request body
    final Map<String, String> data = {
      "email": email,
      "nomor_hp": nomor,
    };

    final response = await http.post(
      Uri.parse('https://2f90-203-29-27-130.ngrok-free.app/api/verivikasi_akun'),
      body: data,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      
      print(responseData);

      userData = UserData.fromJson({
        'id': responseData['id'],
        'email': responseData['email'],
        'name': responseData['name'],
        'nomor_hp': responseData['nomor_hp'],
      });

      

      // Simpan token akses ke shared preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user_data', json.encode(userData.toJson()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Gantipw(),));

      

      print(responseData);

    } else {
      showAlertDialog(context);

      final responseData = json.decode(response.body);

      if (responseData['response'] != null) {
              showAlertDialog(context);

        print(responseData);
      } else {
        print('Gagal masuk: ${response.statusCode}');
        print('Pesan kesalahan: ${response.body}');
      }
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
            Text('Reset Password', style: titleText),
            const SizedBox(height: 5),
            Text('Please enter your email and number address', style: subTitle.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            CustomTextField(textEditingController: email_Controller, textLabel: "Email", pass: false),
            CustomTextField(textEditingController: nomor_Controller, textLabel: "No Hp", pass: false),
            // CustomTextField(textEditingController: password_Controller, textLabel: "Password", pass: true),
            // CustomTextField(textEditingController: password_Confirm_Controller, textLabel: "Confirm Password", pass: true),
            const SizedBox(height: 40),
            GestureDetector(
              child: InkWell(
                onTap: () {
                  _reset();
                  String eemail = email_Controller.text;
                  String HP = nomor_Controller.text;
                  print(eemail);
                  // print(password);
                
                },
                child: PrimaryButton(buttonText: 'Reset Password'),
              ),
            ),
          ],
        ),
      ),
    );
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
    content:  Text("Email atau No.Hp anda salah!!", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
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
  

}