import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_lilyannsalon/login.dart';
import 'package:flutter_application_lilyannsalon/model/user.dart';
import 'package:flutter_application_lilyannsalon/theme.dart';
import 'package:flutter_application_lilyannsalon/widget/custom_textformfield.dart';
import 'package:flutter_application_lilyannsalon/widget/primary_button.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatelessWidget {
  TextEditingController NameController = TextEditingController();
  //TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController passwordConfirmController = TextEditingController();
  late UserData userData;



  Future<void> _register(BuildContext context) async {
    final url =
        Uri.parse('https://2f90-203-29-27-130.ngrok-free.app/api/register');

    final response = await http.post(
      url,
      body: {
        'email': emailController.text,
        'name': NameController.text,
        'password': passwordController.text,
        'nomor_hp': phoneController.text,

      },
    );

    if (response.statusCode == 200) {
      print('Register berhasil');
      // Handle the success response here
      print(response.body);
    }
   
    
    else {
      // Handle the error response here
      print('Gagal mengirim data. Status code: ${response.statusCode}');
      print('gagal');
    }
  }


  

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Padding(
                padding: kDefaultPadding,
                child: Text('Registrasi Akun', style: titleText)),
            const SizedBox(height: 5),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: subTitle,
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
                padding: kDefaultPadding,
                child: CustomTextField(
                    textEditingController: NameController,
                    textLabel: "Name",
                    pass: false)),
            //Padding(padding: kDefaultPadding, child: CustomTextField(textEditingController: firstNameController, textLabel: "First Name", pass: false)),
            Padding(
                padding: kDefaultPadding,
                child: CustomTextField(
                    textEditingController: emailController,
                    textLabel: "Email",
                    pass: false)),
            Padding(
                padding: kDefaultPadding,
                child: CustomTextField(
                    textEditingController: phoneController,
                    textLabel: "Phone Number",
                    pass: false)),
            Padding(
                padding: kDefaultPadding,
                child: CustomTextField(
                    textEditingController: passwordController,
                    textLabel: "Password",
                    pass: true)),
            //Padding(padding: kDefaultPadding, child: CustomTextField(textEditingController: passwordConfirmController, textLabel: "Confirm Password", pass: true)),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Padding(
              padding: kDefaultPadding,
              child: InkWell(
                
                onTap: () {
                  _register(context);
                  String Name = NameController.text;
                  //String fName = firstNameController.text;
                  String email = emailController.text;
                  String phone = phoneController.text;
                  String password = passwordController.text;
                  //String passConfirm = passwordConfirmController.text;

                  print(Name);
                  //print(fName);
                  print(email);
                  print(phone);
                  print(password);
                  //print(passConfirm);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LogInScreen(),
                    ),
                  );
                },
                child: PrimaryButton(buttonText: 'Register'),
                
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}