import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_lilyannsalon/theme.dart';
// import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {

  final TextEditingController textEditingController;
  final String textLabel;
  final bool pass;
  // final Widget? suffixIconn;
  const CustomTextField({super.key, required this.textEditingController, required this.textLabel, required this.pass});
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: widget.textEditingController,
      obscureText: widget.pass ? _isObscure : false,
      decoration: InputDecoration(
        labelText: widget.textLabel,
        labelStyle: const TextStyle(color: kTextFieldColor),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
        suffixIcon: widget.pass ? IconButton(
          onPressed: () {
          setState(() {
            _isObscure = !_isObscure;
           });
          },
          icon: _isObscure ? const Icon(
            Icons.visibility_off,
            color: kTextFieldColor,
          )
          : const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        )
      :null),
    );
  }
}