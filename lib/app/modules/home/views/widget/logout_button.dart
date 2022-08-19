import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/home/controllers/home_controller.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Logout",
              middleText: "Do you really want to logout?",
              textConfirm: "Yes",
              textCancel: "Cancel",
              cancelTextColor: Colors.black,
              confirmTextColor: Colors.white,
              onConfirm: () {
                homeController.logout();
              },
              buttonColor: Color.fromARGB(255, 231, 23, 8),
              onCancel: () {
                Get.back();
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.exit_to_app),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "Logout",
              style: TextStyle(fontSize: 18.sp),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 225, 7, 7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            minimumSize: Size(200.w, 50.h)));
  }
}
