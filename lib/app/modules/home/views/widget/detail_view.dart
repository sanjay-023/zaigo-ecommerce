import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaigoecommerce/app/modules/home/model/data_model.dart';
import 'package:zaigoecommerce/app/modules/home/views/widget/call_button.dart';
import 'package:zaigoecommerce/app/modules/home/views/widget/detail_box.dart';
import 'package:zaigoecommerce/app/modules/home/views/widget/rating_star.dart';

class DetailView extends StatelessWidget {
  final Datum data;
  DetailView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text("Profile"),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close)),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                  leading: CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(data.profilePicture!),
                  ),
                  title: Text(
                    data.name!,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data.fieldOfExpertise!} Lawyer"),
                      data.rating!.isEmpty
                          ? SizedBox()
                          : RatingStar(value: double.parse(data.rating!))
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              DetailBox(
                boxTitle: "Bio",
                data: data.bio!,
              ),
              SizedBox(
                height: 20,
              ),
              DetailBox(
                boxTitle: "Address",
                data: data.address!,
              ),
              SizedBox(
                height: 20,
              ),
              DetailBox(
                boxTitle: "State",
                data: data.state!,
              ),
              SizedBox(
                height: 20,
              ),
              DetailBox(
                boxTitle: "Email",
                data: data.email!,
              ),
              SizedBox(
                height: 20,
              ),
              DetailBox(
                boxTitle: "Contact",
                data: data.phoneNo!,
              ),
              SizedBox(
                height: 10,
              ),
              CallButton(
                phoneNumber: data.phoneNo!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
