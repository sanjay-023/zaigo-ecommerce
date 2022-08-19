import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaigoecommerce/app/modules/location/controllers/location_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    print(locationController.sourceLocation);
    locationController.searchController.text = locationController.locationText;
    locationController.searchAndNavigate(locationController.locationText);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Container(
          child: TextField(
            controller: locationController.searchController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                suffixIcon: IconButton(
                    onPressed: () {
                      Get.delete<LocationController>();
                    },
                    icon: Icon(Icons.search))),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close)),
      ),
      body: GetBuilder<LocationController>(builder: (controller) {
        return GoogleMap(
          onMapCreated: locationController.onMapCreated,
          initialCameraPosition: CameraPosition(
            target: locationController.sourceLocation,
            zoom: 14.5,
          ),
          markers: {
            Marker(
                markerId: MarkerId("source"),
                position: locationController.sourceLocation),
          },
        );
      }),
    );
  }
}
