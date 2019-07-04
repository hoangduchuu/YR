// To parse this JSON data, do
//
//     final requestPasswordEntity = requestPasswordEntityFromJson(jsonString);

import 'dart:convert';

class ForgotEntity {
  bool status;
  String forgotCode;

  ForgotEntity({
    this.status,
    this.forgotCode,
  });

  factory ForgotEntity.fromJson(String str) => ForgotEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForgotEntity.fromMap(Map<String, dynamic> json) => new ForgotEntity(
    status: json["status"] == null ? null : json["status"],
    forgotCode: json["forgotCode"] == null ? null : json["forgotCode"],
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "forgotCode": forgotCode == null ? null : forgotCode,
  };
}
