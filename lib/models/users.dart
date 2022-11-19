// https://app.quicktype.io/

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    required this.otp,
    required this.role,
    required this.token,
    required this.username,
    required this.userpicture,
  });

  String id;
  String otp;
  String role;
  String token;
  String username;
  String userpicture;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        otp: json["otp"],
        role: json["role"],
        token: json["token"],
        username: json["username"],
        userpicture: json["userpicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "otp": otp,
        "role": role,
        "token": token,
        "username": username,
        "userpicture": userpicture,
      };
}
