import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final String textLabel;
  final bool obscureText;

  const Field({
    Key? key,
    
    required this.textLabel,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText ? _isObscure : false,
      decoration: InputDecoration(
        labelText: widget.textLabel,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.blue,
                ),
              )
            : null,
      ),
    );
  }
}