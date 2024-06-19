import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/home.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'package:flutter_application_lilyannsalon/profile.dart';
import 'package:flutter_application_lilyannsalon/registrasi.dart';
import 'package:flutter_application_lilyannsalon/reset_password.dart';
import 'package:flutter_application_lilyannsalon/theme.dart';
import 'package:flutter_application_lilyannsalon/widget/appTab.dart';
import 'package:flutter_application_lilyannsalon/widget/custom_textformfield.dart';
import 'package:flutter_application_lilyannsalon/widget/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginState();
}

class _LoginState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late UserData userData;

  @override
  void initState() {
    super.initState();

    // Periksa apakah token akses sudah ada
    checkUserSession();
  }

  Future<void> checkUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAccessToken = prefs.getString('user_data');

    if (savedAccessToken != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => sideBar()),
      );
      // Token akses sudah ada, mungkin pengguna sudah masuk
      // Anda dapat memeriksa validitas token di sini
      // Misalnya, jika token kedaluwarsa, Anda dapat mengarahkan pengguna untuk logout
      // atau memperbarui token.
    }
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Membuat request body
    final Map<String, String> data = {
      "email": email,
      "password": password,
    };

    final response = await http.post(
      Uri.parse('https://2f90-203-29-27-130.ngrok-free.app/api/login'),
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

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => sideBar()));

      print(responseData);
    } else {
      final responseData = json.decode(response.body);
      // Untuk menampilkan toast

      if (responseData['response'] != null) {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              Text('Selamat Datang!', style: titleText),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text('Belum punya akun?', style: subTitle),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text('Register',
                        style: textButton.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                  textEditingController: _emailController,
                  textLabel: "email",
                  pass: false),
              CustomTextField(
                  textEditingController: _passwordController,
                  textLabel: "password",
                  pass: true),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: const Text(
                  'Lupa password?',
                  style: TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _login,
                child: PrimaryButton(buttonText: 'Log In'),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // void handleLogin(String email, String password) {
  //   print(email);
  //   print(password);
  // }
}