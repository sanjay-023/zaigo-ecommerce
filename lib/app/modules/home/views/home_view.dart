import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/home/model/data_model.dart';
import 'package:zaigoecommerce/app/modules/home/views/widget/detail_view.dart';
import 'package:zaigoecommerce/app/modules/login/controllers/login_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    homeController.getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Lawyers'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: FutureBuilder(
            future: homeController.getData(),
            builder: (context, AsyncSnapshot<List<Datum>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                List<Datum>? data = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(DetailView(
                          data: data![index],
                        ));
                      },
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(data![index].profilePicture!),
                      ),
                      title: Text(data[index].name!),
                      subtitle: Text(data[index].email!),
                    );
                  },
                  itemCount: homeController.dataList.length,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
