// To parse this JSON data, do
//
//     final registerFacebookRequest = registerFacebookRequestFromJson(jsonString);

import 'dart:convert';

import 'package:your_reward_user/data/base/IsToJSON.dart';

class RegisterFacebookRequest implements IsToJSON {
  String facebookId;
  String email;
  String fullname;
  String avatar;
  String tokenKey;
  String strategy;

  RegisterFacebookRequest({
    this.facebookId,
    this.email,
    this.fullname,
    this.avatar,
    this.tokenKey,
    this.strategy,
  });

  factory RegisterFacebookRequest.fromJson(Map<String, dynamic> json) => new RegisterFacebookRequest(
        facebookId: json["facebookId"],
        email: json["email"],
        fullname: json["fullname"],
        avatar: json["avatar"],
        tokenKey: json["tokenKey"],
        strategy: json["strategy"],
      );

  @override
  String toJSON() {
    Map<String, dynamic> toJson() => {
          "facebookId": facebookId,
          "email": email,
          "fullname": fullname,
          "avatar": avatar,
          "tokenKey": tokenKey,
          "strategy": strategy,
        };
    return json.encode(toJson());
  }
}
