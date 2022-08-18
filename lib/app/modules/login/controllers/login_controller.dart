import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zaigoecommerce/app/modules/home/views/home_view.dart';
import 'package:zaigoecommerce/app/modules/login/Model/login_model.dart';

class LoginController extends GetxController {
  List<LoginModel> dataList = [];
  LoginModel data = LoginModel();
  final String apiUrl =
      'http://80.211.233.121/blacklight/blacklight/public/api/auth/login';

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(Uri.parse(apiUrl),
          body: ({
            "phone_no": phoneController.text,
            "password": passwordController.text
          }));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        data = LoginModel.fromJson(json);
        dataList.add(data);

        update();
        Fluttertoast.showToast(msg: data.message.toString());

        print(data);

        Get.offAll(HomeView());
      } else {
        Get.snackbar("Login Failed", "Enter valid credentials");
      }
    } else {
      Get.snackbar("Login Failed", "Enter phone number and password");
    }
  }
}
