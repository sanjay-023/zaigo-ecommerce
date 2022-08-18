import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/home/controllers/home_controller.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber;
  CallButton({Key? key, required this.phoneNumber}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          homeController.makePhoneCall(phoneNumber);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone),
            SizedBox(
              width: 8,
            ),
            Text(
              "Call",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 15, 176, 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            minimumSize: Size(200, 50)));
  }
}
