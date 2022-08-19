import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/location/views/widget/loc_text_box.dart';

import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  final locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Find Location'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                LocationTextBox(
                    hText: "Door Number",
                    textController: locationController.doorController),
                SizedBox(
                  height: 20.h,
                ),
                LocationTextBox(
                    hText: "Street Name",
                    textController: locationController.streetController),
                SizedBox(
                  height: 20.h,
                ),
                LocationTextBox(
                    hText: "City",
                    textController: locationController.cityController),
                SizedBox(
                  height: 20.h,
                ),
                LocationTextBox(
                    hText: "State",
                    textController: locationController.stateController),
                SizedBox(
                  height: 20.h,
                ),
                LocationTextBox(
                    hText: "Country",
                    textController: locationController.countryController),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      locationController.onLocationButtonClicked();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(
                          width: 8.h,
                        ),
                        Text(
                          "Locate",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 209, 9, 9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(200.w, 50.h)))
              ],
            ),
          ),
        ));
  }
}
