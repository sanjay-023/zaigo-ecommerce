import 'package:flutter/material.dart';

class LoginTextBox extends StatelessWidget {
  final String hText;
  final int boxIndex;
  final IconData textIcon;
  final TextEditingController textBoxController;
  LoginTextBox(
      {Key? key,
      required this.hText,
      required this.boxIndex,
      required this.textIcon,
      required this.textBoxController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textBoxController,
      obscureText: boxIndex == 1 ? true : false,
      decoration: InputDecoration(
          prefixIcon: Icon(textIcon),
          hintText: hText,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 124, 123, 123))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 124, 123, 123))),
          hintStyle: TextStyle(color: Color.fromARGB(255, 124, 123, 123)),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 124, 123, 123)))),
    );
  }
}
