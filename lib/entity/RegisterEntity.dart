// To parse this JSON data, do
//
//     final registerEntity = registerEntityFromJson(jsonString);

import 'dart:convert';

class RegisterEntity {
  String gender;
  String status;
  String role;
  int points;
  bool isNotificationEmail;
  bool isNotificationApplication;
  bool isNotificationPromotion;
  bool isNotificationEvent;
  bool isProfile;
  String id;
  String email;
  String fullname;
  String thumbnail;
  String phone;
  String address;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  RegisterEntity({
    this.gender,
    this.status,
    this.role,
    this.points,
    this.isNotificationEmail,
    this.isNotificationApplication,
    this.isNotificationPromotion,
    this.isNotificationEvent,
    this.isProfile,
    this.id,
    this.email,
    this.fullname,
    this.thumbnail,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RegisterEntity.fromJson(Map<String, dynamic> json) =>
      new RegisterEntity(
        gender: json["gender"],
        status: json["status"],
        role: json["role"],
        points: json["points"],
        isNotificationEmail: json["isNotificationEmail"],
        isNotificationApplication: json["isNotificationApplication"],
        isNotificationPromotion: json["isNotificationPromotion"],
        isNotificationEvent: json["isNotificationEvent"],
        isProfile: json["isProfile"],
        id: json["_id"],
        email: json["email"],
        fullname: json["fullname"],
        thumbnail: json["thumbnail"],
        phone: json["phone"],
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "status": status,
        "role": role,
        "points": points,
        "isNotificationEmail": isNotificationEmail,
        "isNotificationApplication": isNotificationApplication,
        "isNotificationPromotion": isNotificationPromotion,
        "isNotificationEvent": isNotificationEvent,
        "isProfile": isProfile,
        "_id": id,
        "email": email,
        "fullname": fullname,
        "thumbnail": thumbnail,
        "phone": phone,
        "address": address,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };

  @override
  String toString() {
    return 'RegisterEntity{gender: $gender, status: $status, role: $role, points: $points, isNotificationEmail: $isNotificationEmail, isNotificationApplication: $isNotificationApplication, isNotificationPromotion: $isNotificationPromotion, isNotificationEvent: $isNotificationEvent, isProfile: $isProfile, id: $id, email: $email, fullname: $fullname, thumbnail: $thumbnail, phone: $phone, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}
