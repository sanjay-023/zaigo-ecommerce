import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("LOGIN")],
        ),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 79, 33, 243),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            minimumSize: Size(200, 50)));
  }
}
