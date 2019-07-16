// To parse this JSON data, do
//
//     final loginFacebookEntity = loginFacebookEntityFromJson(jsonString);

import 'dart:convert';

import 'package:your_reward_user/entity/userEntity.dart';

class LoginFacebookEntity {
  AccessTokenEntity accessToken;
  UserEntity user;

  LoginFacebookEntity({
    this.accessToken,
    this.user,
  });

  factory LoginFacebookEntity.fromJson(String str) => LoginFacebookEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginFacebookEntity.fromMap(Map<String, dynamic> json) => new LoginFacebookEntity(
        accessToken: json["accessToken"] == null ? null : AccessTokenEntity.fromMap(json["accessToken"]),
        user: json["user"] == null ? null : UserEntity.fromJson(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "accessToken": accessToken == null ? null : accessToken.toMap(),
        "user": user == null ? null : user.toJson(),
      };
}

class AccessTokenEntity {
  String accessToken;
  UserEntity user;

  AccessTokenEntity({
    this.accessToken,
    this.user,
  });

  factory AccessTokenEntity.fromJson(String str) => AccessTokenEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessTokenEntity.fromMap(Map<String, dynamic> json) => new AccessTokenEntity(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        user: json["user"] == null ? null : UserEntity.fromJson(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "accessToken": accessToken == null ? null : accessToken,
        "user": user == null ? null : user.toJson(),
      };
}
