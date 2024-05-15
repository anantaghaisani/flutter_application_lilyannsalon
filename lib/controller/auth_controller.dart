import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/login.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'package:http/http.dart' as http;
class ApiConfig {
  static String apiUrl = "http://192.168.2.198:8000";
  static void setApiUrl(String newUrl){
    apiUrl = newUrl;
  }
}
class AuthController {
  static late String _token;
  static void setToken(String token){
    _token = token;
  }
  static String getToken(){
    return _token;
  }
  static Future<void> login(BuildContext context, String email, String password) async{
    try {
      final String apiUrl = "${ApiConfig.apiUrl}/api/auth/Login";
      final response = await http.post(Uri.parse(apiUrl), body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final token = jsonData['data']['token'] as String;
        setToken(token);
        await tokenRequest(context, token);
      }
    } catch (e) {
      print('Error: $e');
      
    }
  }
  
  static tokenRequest(BuildContext context, String token) async {
    try {
      final responseData = await http.get(
        Uri.parse("${ApiConfig.apiUrl}/api/auth/Me"),
        headers: {'Authorization': 'Bearer $token'}
      );
      if (responseData.statusCode == 200) {
        final jsonGet = jsonDecode(responseData.body) as Map<String, dynamic>;
        final userData = UserData.fromJson(jsonGet['data'] as Map<String, dynamic>);
        _showMessageDialog(context, userData.namaLengkap);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  static Future<void> logout(BuildContext context, String token) async {
    try {
      final String apiUrl = "${ApiConfig.apiUrl}/api/auth/Logout";
      final response = await http.post(Uri.parse(apiUrl), headers: {'Authorization': 'Bearer $_token'});
      if (response.statusCode == 200) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LogInScreen()));
      } else {
        print('Logout failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
void _showMessageDialog(BuildContext context, String data) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Login Successful',
      desc: 'Welcome, $data',
      ).show();

      Future.delayed(const Duration(seconds: 2), () {// ini nanti buat navbar
      });
  }