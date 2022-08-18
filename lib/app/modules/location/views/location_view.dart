import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/location/views/widget/loc_text_box.dart';

import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
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
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              LocationTextBox(hText: "Door Number"),
              SizedBox(
                height: 20,
              ),
              LocationTextBox(hText: "Street Name"),
              SizedBox(
                height: 20,
              ),
              LocationTextBox(hText: "City"),
              SizedBox(
                height: 20,
              ),
              LocationTextBox(hText: "State"),
              SizedBox(
                height: 20,
              ),
              LocationTextBox(hText: "Country"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(
                        width: 8,
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
                      minimumSize: Size(200, 50)))
            ],
          ),
        ));
  }
}
