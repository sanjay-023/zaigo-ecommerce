import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigoecommerce/app/modules/home/views/home_view.dart';
import 'package:zaigoecommerce/app/modules/login/Model/login_model.dart';
import 'package:zaigoecommerce/main.dart';

class LoginController extends GetxController {
  List<LoginModel> dataList = [];
  LoginModel data = LoginModel();
  final String apiUrl =
      'http://80.211.233.121/blacklight/blacklight/public/api/auth/login';

  Future<void> login(String phone, String password) async {
    if (phone.isNotEmpty && password.isNotEmpty) {
      var response = await http.post(Uri.parse(apiUrl),
          body: ({"phone_no": phone, "password": password}));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        data = LoginModel.fromJson(json);
        dataList.add(data);

        update();
        Fluttertoast.showToast(msg: data.message.toString());

        print(data);
        final sharedprfns = await SharedPreferences.getInstance();
        await sharedprfns.setBool(SAVE_KEY, true);

        Get.offAll(HomeView());
      } else {
        Get.snackbar("Login Failed", "Enter valid credentials");
      }
    } else {
      Get.snackbar("Login Failed", "Enter phone number and password");
    }
  }
}
