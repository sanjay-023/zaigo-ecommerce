import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/gallery/views/widget/image_view.dart';

import '../controllers/gallery_controller.dart';

class GalleryView extends GetView<GalleryController> {
  final galleryController = Get.put(GalleryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GalleryView'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            galleryController.takePhoto();
          },
          child: Icon(Icons.camera_alt),
        ),
        body: GetBuilder<GalleryController>(builder: (controller) {
          return GridView.builder(
            itemCount: galleryController.listImagePath.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Get.to(Imageviewer(
                          image: galleryController.listImagePath[index]));
                    },
                    child: Hero(
                      tag: galleryController.listImagePath[index],
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(File(
                                    galleryController.listImagePath[index])))),
                      ),
                    )),
              );
            },
          );
        }));
  }
}
