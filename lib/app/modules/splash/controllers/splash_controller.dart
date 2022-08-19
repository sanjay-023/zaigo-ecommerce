import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaigoecommerce/app/modules/home/views/home_view.dart';
import 'package:zaigoecommerce/app/modules/login/views/login_view.dart';
import 'package:zaigoecommerce/main.dart';

class SplashController extends GetxController {
  // //TODO: Implement SplashController

  // final count = 0.obs;
  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(LoginView());
  }

  void checkUserLoggedIn() async {
    final sharedprfns = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprfns.getString(SAVE_KEY);
    print(SAVE_KEY);
    if (userLoggedIn == null || userLoggedIn == "") {
      gotologin();
    } else {
      Get.off(HomeView());
    }
  }
}
