// To parse this JSON data, do
//
//     final profileUpdateRequest = profileUpdateRequestFromJson(jsonString);

import 'dart:convert';

class UpdateProfileEntity {
  String id;
  String gender;
  String status;
  String role;
  int points;
  bool isNotificationEmail;
  bool isNotificationApplication;
  bool isNotificationPromotion;
  bool isNotificationEvent;
  bool isProfile;
  String email;
  String fullname;
  String thumbnail;
  String phone;
  String address;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String forgotCode;

  UpdateProfileEntity({
    this.id,
    this.gender,
    this.status,
    this.role,
    this.points,
    this.isNotificationEmail,
    this.isNotificationApplication,
    this.isNotificationPromotion,
    this.isNotificationEvent,
    this.isProfile,
    this.email,
    this.fullname,
    this.thumbnail,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.forgotCode,
  });

  factory UpdateProfileEntity.fromJson(String str) => UpdateProfileEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateProfileEntity.fromMap(Map<String, dynamic> json) => new UpdateProfileEntity(
        id: json["_id"] == null ? null : json["_id"],
        gender: json["gender"] == null ? null : json["gender"],
        status: json["status"] == null ? null : json["status"],
        role: json["role"] == null ? null : json["role"],
        points: json["points"] == null ? null : json["points"],
        isNotificationEmail: json["isNotificationEmail"] == null ? null : json["isNotificationEmail"],
        isNotificationApplication: json["isNotificationApplication"] == null ? null : json["isNotificationApplication"],
        isNotificationPromotion: json["isNotificationPromotion"] == null ? null : json["isNotificationPromotion"],
        isNotificationEvent: json["isNotificationEvent"] == null ? null : json["isNotificationEvent"],
        isProfile: json["isProfile"] == null ? null : json["isProfile"],
        email: json["email"] == null ? null : json["email"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        phone: json["phone"] == null ? null : json["phone"],
        address: json["address"] == null ? null : json["address"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        forgotCode: json["forgotCode"] == null ? null : json["forgotCode"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "gender": gender == null ? null : gender,
        "status": status == null ? null : status,
        "role": role == null ? null : role,
        "points": points == null ? null : points,
        "isNotificationEmail": isNotificationEmail == null ? null : isNotificationEmail,
        "isNotificationApplication": isNotificationApplication == null ? null : isNotificationApplication,
        "isNotificationPromotion": isNotificationPromotion == null ? null : isNotificationPromotion,
        "isNotificationEvent": isNotificationEvent == null ? null : isNotificationEvent,
        "isProfile": isProfile == null ? null : isProfile,
        "email": email == null ? null : email,
        "fullname": fullname == null ? null : fullname,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "phone": phone == null ? null : phone,
        "address": address == null ? null : address,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "forgotCode": forgotCode == null ? null : forgotCode,
      };
}
