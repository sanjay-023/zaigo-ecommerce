import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 220.h,
          width: 220.w,
          child: Image.asset(
            'asset/images/Screenshot from 2022-08-17 17-31-22.png',
          ),
        ),
      ),
    );
  }
}
