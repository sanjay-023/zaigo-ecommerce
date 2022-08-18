import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/login/views/widget/login_button.dart';
import 'package:zaigoecommerce/app/modules/login/views/widget/text_box.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: LoginButton(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MediaQuery.of(context).viewInsets.bottom == 0
                              ? Image(
                                  width: 220,
                                  height: 220,
                                  image: AssetImage(
                                      "asset/images/Screenshot from 2022-08-17 17-31-22.png"))
                              : SizedBox(
                                  height: 50,
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome User",
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter your details to login to your account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      LoginTextBox(
                        textBoxController: loginController.phoneController,
                        boxIndex: 0,
                        textIcon: Icons.person,
                        hText: "Enter username/Email id",
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      LoginTextBox(
                        textBoxController: loginController.passwordController,
                        textIcon: Icons.lock,
                        boxIndex: 1,
                        hText: "Enter Password",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {}, child: Text("Forgot Password?"))
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
