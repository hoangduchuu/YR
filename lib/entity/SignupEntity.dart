// To parse this JSON data, do
//
//     final signupEntity = signupEntityFromJson(jsonString);

import 'dart:convert';

class SignupEntity {
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
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  SignupEntity({
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
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SignupEntity.fromJson(String str) => SignupEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignupEntity.fromMap(Map<String, dynamic> json) => new SignupEntity(
        gender: json["gender"] == null ? null : json["gender"],
        status: json["status"] == null ? null : json["status"],
        role: json["role"] == null ? null : json["role"],
        points: json["points"] == null ? null : json["points"],
        isNotificationEmail: json["isNotificationEmail"] == null ? null : json["isNotificationEmail"],
        isNotificationApplication: json["isNotificationApplication"] == null ? null : json["isNotificationApplication"],
        isNotificationPromotion: json["isNotificationPromotion"] == null ? null : json["isNotificationPromotion"],
        isNotificationEvent: json["isNotificationEvent"] == null ? null : json["isNotificationEvent"],
        isProfile: json["isProfile"] == null ? null : json["isProfile"],
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        phone: json["phone"] == null ? null : json["phone"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "gender": gender == null ? null : gender,
        "status": status == null ? null : status,
        "role": role == null ? null : role,
        "points": points == null ? null : points,
        "isNotificationEmail": isNotificationEmail == null ? null : isNotificationEmail,
        "isNotificationApplication": isNotificationApplication == null ? null : isNotificationApplication,
        "isNotificationPromotion": isNotificationPromotion == null ? null : isNotificationPromotion,
        "isNotificationEvent": isNotificationEvent == null ? null : isNotificationEvent,
        "isProfile": isProfile == null ? null : isProfile,
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "fullname": fullname == null ? null : fullname,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "phone": phone == null ? null : phone,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
