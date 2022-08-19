import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/home/controllers/home_controller.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          homeController.logout();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.exit_to_app),
            SizedBox(
              width: 8,
            ),
            Text(
              "Logout",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 225, 7, 7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            minimumSize: Size(200, 50)));
  }
}
