// To parse this JSON data, do
//
//     final loginEntity = loginEntityFromJson(jsonString);

import 'dart:convert';

import 'package:your_reward_user/model/user.dart';

LoginEntity loginEntityFromJson(String str) =>
    LoginEntity.fromJson(json.decode(str));

String loginEntityToJson(LoginEntity data) => json.encode(data.toJson());

class LoginEntity {
  String accessToken;
  User user;

  LoginEntity({
    this.accessToken,
    this.user,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) => new LoginEntity(
        accessToken: json["accessToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user.toJson(),
      };

  @override
  String toString() {
    return 'LoginEntity{accessToken: $accessToken, user: $user}';
  }



}
