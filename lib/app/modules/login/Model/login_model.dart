// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
    this.accessToken,
    this.userId,
    this.name,
    this.tokenType,
    this.uuid,
    this.expiresIn,
    this.referalStatus,
  });

  String? message;
  String? accessToken;
  int? userId;
  String? name;
  String? tokenType;
  String? uuid;
  int? expiresIn;
  String? referalStatus;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        accessToken: json["access_token"],
        userId: json["user_id"],
        name: json["name"],
        tokenType: json["token_type"],
        uuid: json["uuid"],
        expiresIn: json["expires_in"],
        referalStatus: json["referal_status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
        "user_id": userId,
        "name": name,
        "token_type": tokenType,
        "uuid": uuid,
        "expires_in": expiresIn,
        "referal_status": referalStatus,
      };
}
