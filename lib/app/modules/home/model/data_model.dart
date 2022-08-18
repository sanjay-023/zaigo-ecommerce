// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.message,
    this.code,
    this.data,
    this.pages,
  });

  String? message;
  int? code;
  List<Datum>? data;
  int? pages;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        message: json["message"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "pages": pages,
      };
}

class Datum {
  Datum({
    this.id,
    this.uuid,
    this.name,
    this.address,
    this.state,
    this.fieldOfExpertise,
    this.bio,
    this.level,
    this.hoursLogged,
    this.phoneNo,
    this.email,
    this.areasOfPractise,
    this.serviceOffered,
    this.profilePicture,
    this.rating,
    this.ranking,
  });

  int? id;
  String? uuid;
  String? name;
  String? address;
  String? state;
  String? fieldOfExpertise;
  String? bio;
  String? level;
  String? hoursLogged;
  String? phoneNo;
  String? email;
  List<dynamic>? areasOfPractise;
  List<dynamic>? serviceOffered;
  String? profilePicture;
  String? rating;
  String? ranking;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        address: json["address"],
        state: json["state"],
        fieldOfExpertise: json["field_of_expertise"],
        bio: json["bio"],
        level: json["level"],
        hoursLogged: json["hours_logged"],
        phoneNo: json["phone_no"],
        email: json["email"],
        areasOfPractise:
            List<dynamic>.from(json["areas_of_practise"].map((x) => x)),
        serviceOffered:
            List<dynamic>.from(json["service_offered"].map((x) => x)),
        profilePicture: json["profile_picture"],
        rating: json["rating"],
        ranking: json["ranking"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "address": address,
        "state": state,
        "field_of_expertise": fieldOfExpertise,
        "bio": bio,
        "level": level,
        "hours_logged": hoursLogged,
        "phone_no": phoneNo,
        "email": email,
        "areas_of_practise": List<dynamic>.from(areasOfPractise!.map((x) => x)),
        "service_offered": List<dynamic>.from(serviceOffered!.map((x) => x)),
        "profile_picture": profilePicture,
        "rating": rating,
        "ranking": ranking,
      };
}
