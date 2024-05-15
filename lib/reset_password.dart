import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/login.dart';
import 'package:flutter_application_lilyannsalon/theme.dart';
import 'package:flutter_application_lilyannsalon/widget/custom_textformfield.dart';
import 'package:flutter_application_lilyannsalon/widget/primary_button.dart';
// import 'package:flutter_application_lilyannsalon/widget/reset_form.dart';

class ResetPasswordScreen extends StatelessWidget {

  final TextEditingController email_Controller = TextEditingController();
  final TextEditingController password_Controller = TextEditingController();
  final TextEditingController password_Confirm_Controller = TextEditingController();
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
            Text('Please enter your email address', style: subTitle.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            CustomTextField(textEditingController: email_Controller, textLabel: "Email", pass: false),
            // CustomTextField(textEditingController: password_Controller, textLabel: "Password", pass: true),
            // CustomTextField(textEditingController: password_Confirm_Controller, textLabel: "Confirm Password", pass: true),
            const SizedBox(height: 40),
            GestureDetector(
              child: InkWell(
                onTap: () {
                  String eemail = email_Controller.text;
                  // String password = password_Controller.text;
                  print(eemail);
                  // print(password);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInScreen(),
                    )
                  );
                },
                child: PrimaryButton(buttonText: 'Reset Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}