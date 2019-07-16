import 'dart:convert';

import 'OwnerEntity.dart';

class StoreEntity {
  String id;
  String openHours;
  int rating;
  String status;
  String title;
  String address;
  String email;
  String phone;
  String addressLat;
  String addressLng;
  String ownerId;
  String description;
  String thumbnail;
  String authorId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  OwnerEntity owner;
  List<String> images;
  String openHourEnd;
  String openHourStart;

  StoreEntity({
    this.id,
    this.openHours,
    this.rating,
    this.status,
    this.title,
    this.address,
    this.email,
    this.phone,
    this.addressLat,
    this.addressLng,
    this.ownerId,
    this.description,
    this.thumbnail,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.owner,
    this.images,
    this.openHourEnd,
    this.openHourStart,
  });

  factory StoreEntity.fromRawJson(String str) => StoreEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoreEntity.fromJson(Map<String, dynamic> json) => new StoreEntity(
        id: json["_id"],
        openHours: json["openHours"],
        rating: json["rating"],
        status: json["status"],
        title: json["title"],
        address: json["address"],
        email: json["email"],
        phone: json["phone"],
        addressLat: json["addressLat"],
        addressLng: json["addressLng"],
        ownerId: json["ownerId"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        authorId: json["authorId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        owner: OwnerEntity.fromJson(json["owner"]),
        images: json["images"] == null ? null : new List<String>.from(json["images"].map((x) => x)),
        openHourEnd: json["openHourEnd"] == null ? null : json["openHourEnd"],
        openHourStart: json["openHourStart"] == null ? null : json["openHourStart"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "openHours": openHours,
        "rating": rating,
        "status": status,
        "title": title,
        "address": address,
        "email": email,
        "phone": phone,
        "addressLat": addressLat,
        "addressLng": addressLng,
        "ownerId": ownerId,
        "description": description,
        "thumbnail": thumbnail,
        "authorId": authorId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "owner": owner.toJson(),
        "images": images == null ? null : new List<dynamic>.from(images.map((x) => x)),
        "openHourEnd": openHourEnd == null ? null : openHourEnd,
        "openHourStart": openHourStart == null ? null : openHourStart,
      };
}
