// To parse this JSON data, do
//
//     final userRequest = userRequestFromJson(jsonString);

import 'dart:convert';

class UserRequest {
  String email;
  String phone;
  String fullname;
  String id;

  UserRequest({
    this.email,
    this.phone,
    this.fullname,
    this.id
  });

  factory UserRequest.fromJson(String str) => UserRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserRequest.fromMap(Map<String, dynamic> json) => new UserRequest(
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    fullname: json["fullname"] == null ? null : json["fullname"],
  );

  Map<String, dynamic> toMap() => {
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "fullname": fullname == null ? null : fullname,
  };
}
