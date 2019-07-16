// To parse this JSON data, do
//
//     final changPasswordEntity = changPasswordEntityFromJson(jsonString);

import 'dart:convert';

class ChangePasswordEntity {
  bool status;
  String email;
  String phone;
  String role;

  ChangePasswordEntity({
    this.status,
    this.email,
    this.phone,
    this.role,
  });

  factory ChangePasswordEntity.fromJson(String str) => ChangePasswordEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChangePasswordEntity.fromMap(Map<String, dynamic> json) => new ChangePasswordEntity(
        status: json["status"] == null ? null : json["status"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "role": role == null ? null : role,
      };
}
