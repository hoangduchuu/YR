import 'dart:convert';

class OwnerEntity {
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
  String fullname;
  String email;
  String phone;
  String address;
  String thumbnail;
  String storeId;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String ownerBackground;
  String ownerLogo;
  String clientEmail;

  OwnerEntity({
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
    this.fullname,
    this.email,
    this.phone,
    this.address,
    this.thumbnail,
    this.storeId,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.ownerBackground,
    this.ownerLogo,
    this.clientEmail,
  });

  factory OwnerEntity.fromRawJson(String str) =>
      OwnerEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OwnerEntity.fromJson(Map<String, dynamic> json) => new OwnerEntity(
        id: json["_id"],
        gender: json["gender"],
        status: json["status"],
        role: json["role"],
        points: json["points"],
        isNotificationEmail: json["isNotificationEmail"],
        isNotificationApplication: json["isNotificationApplication"],
        isNotificationPromotion: json["isNotificationPromotion"],
        isNotificationEvent: json["isNotificationEvent"],
        isProfile: json["isProfile"],
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"] == null ? null : json["address"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        storeId: json["storeId"] == null ? null : json["storeId"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        ownerBackground:
            json["ownerBackground"] == null ? null : json["ownerBackground"],
        ownerLogo: json["ownerLogo"] == null ? null : json["ownerLogo"],
        clientEmail: json["clientEmail"] == null ? null : json["clientEmail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "gender": gender,
        "status": status,
        "role": role,
        "points": points,
        "isNotificationEmail": isNotificationEmail,
        "isNotificationApplication": isNotificationApplication,
        "isNotificationPromotion": isNotificationPromotion,
        "isNotificationEvent": isNotificationEvent,
        "isProfile": isProfile,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "address": address == null ? null : address,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "storeId": storeId == null ? null : storeId,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "ownerBackground": ownerBackground == null ? null : ownerBackground,
        "ownerLogo": ownerLogo == null ? null : ownerLogo,
        "clientEmail": clientEmail == null ? null : clientEmail,
      };

  @override
  String toString() {
    return 'OwnerEntity{id: $id, gender: $gender, status: $status, role: $role, points: $points, isNotificationEmail: $isNotificationEmail, isNotificationApplication: $isNotificationApplication, isNotificationPromotion: $isNotificationPromotion, isNotificationEvent: $isNotificationEvent, isProfile: $isProfile, fullname: $fullname, email: $email, phone: $phone, address: $address, thumbnail: $thumbnail, storeId: $storeId, password: $password, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, ownerBackground: $ownerBackground, ownerLogo: $ownerLogo, clientEmail: $clientEmail}';
  }
}
