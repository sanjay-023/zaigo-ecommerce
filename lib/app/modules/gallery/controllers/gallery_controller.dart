import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class GalleryController extends GetxController {
  List<String> listImagePath = [];
  Directory? directory;
  File? image;

  @override
  void onInit() {
    super.onInit();
    Directory dir = Directory.fromUri(Uri.parse(
        '/storage/emulated/0/Android/data/com.zaigoecommerce.zaigoecommerce/files'));

    fetchFiles(dir);
  }

  fetchFiles(Directory dir) async {
    listImagePath.clear();
    var value = await dir.list().toList();
    print('hello$value');
    for (int i = 0; i < value.length; i++) {
      if (value[i]
              .path
              .substring((value[i].path.length - 4), (value[i].path.length)) ==
          ".jpg") {
        listImagePath.add(value[i].path);
      }
    }
    update();
    //print(listImagePath);
  }

  takePhoto() async {
    var result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result == null) {
      //print("image null");
      return;
    }
    image = File(result.path);
    directory = await getExternalStorageDirectory();
    print(directory!.path);
    await image!.copy('${directory!.path}/${DateTime.now()}.jpg');
    //print(str);
    Directory dir = directory!;
    fetchFiles(dir);

    update();
  }
}
