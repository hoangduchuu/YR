// To parse this JSON data, do
//
//     final findEmailEntity = findEmailEntityFromJson(jsonString);

import 'dart:convert';

class FindEmailEntity {
  String email;
  String role;

  FindEmailEntity({
    this.email,
    this.role,
  });

  factory FindEmailEntity.fromJson(String str) => FindEmailEntity.fromMap(json.decode(str));

  factory FindEmailEntity.fromMap(Map<String, dynamic> json) => new FindEmailEntity(
        email: json["email"] == null ? null : json["email"],
        role: json["role"] == null ? null : json["role"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "email": email == null ? null : email,
        "role": role == null ? null : role,
      };

  @override
  String toString() {
    return "FindEmailEntity $email --- $role";
  }
}

class FindEmailNotFoundEntity {
  @override
  String toString() {
    return "FindEmailNotFoundEntity";
  }
}
