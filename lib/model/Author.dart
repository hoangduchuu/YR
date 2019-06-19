import 'dart:convert';

class AuthorEntity {
  String id;
  String gender;
  String status;
  String role;
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
  int points;

  AuthorEntity({
    this.id,
    this.gender,
    this.status,
    this.role,
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
    this.points,
  });

  factory AuthorEntity.fromRawJson(String str) => AuthorEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorEntity.fromJson(Map<String, dynamic> json) => new AuthorEntity(
        id: json["_id"],
        gender: json["gender"],
        status: json["status"],
        role: json["role"],
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        thumbnail: json["thumbnail"],
        storeId: json["storeId"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "gender": gender,
        "status": status,
        "role": role,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "address": address,
        "thumbnail": thumbnail,
        "storeId": storeId,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "points": points,
      };
}
