import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaigoecommerce/app/modules/location/views/widget/map_scree.dart';

class LocationController extends GetxController {
  // //TODO: Implement LocationController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  final doorController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final searchController = TextEditingController();
  String locationText = "";

  LatLng sourceLocation = LatLng(12.25953, 75.1352);
  GoogleMapController? mapController;

  onMapCreated(controller) {
    mapController = controller;
    update();
  }

  searchAndNavigate(String address) {
    locationFromAddress(address).then(
      (result) {
        mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(result[0].latitude, result[0].longitude),
                zoom: 14.5)));
        sourceLocation = LatLng(result[0].latitude, result[0].longitude);
      },
    );
    update();
  }

  onLocationButtonClicked() {
    locationText = "";
    if (doorController.text.isNotEmpty ||
        streetController.text.isNotEmpty ||
        cityController.text.isNotEmpty ||
        stateController.text.isNotEmpty ||
        countryController.text.isNotEmpty) {
      locationText =
          "${streetController.text},${cityController.text},${stateController.text},${countryController.text}";
      doorController.clear();
      streetController.clear();
      cityController.clear();
      stateController.clear();
      countryController.clear();

      update();

      Get.to(MapScreen());
    } else {
      Get.snackbar("Sorry!", "All Fields required");
    }
  }
}
