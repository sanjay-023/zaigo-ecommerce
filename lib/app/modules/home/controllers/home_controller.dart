import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zaigoecommerce/app/modules/home/model/data_model.dart';
import 'package:zaigoecommerce/app/modules/login/controllers/login_controller.dart';
import 'package:zaigoecommerce/app/modules/login/views/login_view.dart';

class HomeController extends GetxController {
  final loginController = Get.put(LoginController());
  List<Datum> dataList = [];
  final String apiUrl =
      "http://80.211.233.121/blacklight/blacklight/public/api/lawyers/index";
  Future<List<Datum>> getData() async {
    final response = await http.get(Uri.parse(apiUrl),
        headers: ({
          "Authorization": "Bearer ${loginController.data.accessToken}"
        }));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['data'];

      dataList = body.map((dynamic item) => Datum.fromJson(item)).toList();
      update();

      print(dataList);
      return dataList;
    } else {
      throw ("cannot get data");
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void logout() async {
    final sharedprfns = await SharedPreferences.getInstance();
    sharedprfns.clear();
    Get.offAll(LoginView());
  }
}
