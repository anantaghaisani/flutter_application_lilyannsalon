import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/controller/auth_controller.dart';
import 'package:flutter_application_lilyannsalon/theme.dart';
import 'package:flutter_application_lilyannsalon/widget/custom_textformfield.dart';
// import 'package:flutter_application_lilyannsalon/widget/login_form.dart';
import 'package:flutter_application_lilyannsalon/widget/primary_button.dart';
// import 'package:flutter_application_lilyannsalon/widget/reset_form.dart';
import 'package:flutter_application_lilyannsalon/reset_password.dart';
import 'package:flutter_application_lilyannsalon/registrasi.dart';

class LogInScreen extends StatelessWidget {

  // final GlobalKey<LogInFormState> _logInFormKey = GlobalKey<LogInFormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


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
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));},
                    child: 
                      Text('Register', style: textButton.copyWith(decoration: TextDecoration.underline, decorationThickness: 1)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              
              CustomTextField(textEditingController: _emailController, textLabel: "Email", pass: false),
              CustomTextField(textEditingController: _passwordController, textLabel: "Password", pass: true),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));},
                child: 
                const Text('Lupa password?',
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
                onTap: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  
                  await AuthController.login(context, email, password);
                },
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