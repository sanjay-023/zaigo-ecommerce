import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/login/controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  final String phoneText;
  final String passwordText;
  LoginButton({Key? key, required this.phoneText, required this.passwordText})
      : super(key: key);
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          loginController.login(phoneText, passwordText);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("LOGIN")],
        ),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 79, 33, 243),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            minimumSize: Size(200.w, 50.h)));
  }
}
