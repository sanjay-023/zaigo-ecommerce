import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/login/controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          loginController.login();
        },
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
