import 'package:flutter/material.dart';

class LocationTextBox extends StatelessWidget {
  final String hText;
  final TextEditingController textController;
  const LocationTextBox(
      {Key? key, required this.hText, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
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
