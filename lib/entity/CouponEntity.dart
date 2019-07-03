// To parse this JSON data, do
//
//     final couponEntity = couponEntityFromJson(jsonString);

import 'dart:convert';

import 'OwnerEntity.dart';

class CouponEntity {
  String id;
  String objectType;
  String giftType;
  int totalUsed;
  String pointValue;
  bool isAlwaysApply;
  String status;
  String title;
  String code;
  String description;
  dynamic startDate;
  dynamic endDate;
  String orderAmt;
  String thumbnail;
  String discountPercentage;
  String discountMaxAmt;
  String productId;
  String storeId;
  String ownerId;
  String authorId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  OwnerEntity owner;

  CouponEntity({
    this.id,
    this.objectType,
    this.giftType,
    this.totalUsed,
    this.pointValue,
    this.isAlwaysApply,
    this.status,
    this.title,
    this.code,
    this.description,
    this.startDate,
    this.endDate,
    this.orderAmt,
    this.thumbnail,
    this.discountPercentage,
    this.discountMaxAmt,
    this.productId,
    this.storeId,
    this.ownerId,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.owner,
  });

  factory CouponEntity.fromRawJson(String str) => CouponEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CouponEntity.fromJson(Map<String, dynamic> json) => new CouponEntity(
    id: json["_id"],
    objectType: json["objectType"],
    giftType: json["giftType"],
    totalUsed: json["totalUsed"],
    pointValue: json["pointValue"],
    isAlwaysApply: json["isAlwaysApply"],
    status: json["status"],
    title: json["title"],
    code: json["code"],
    description: json["description"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    orderAmt: json["orderAmt"],
    thumbnail: json["thumbnail"],
    discountPercentage: json["discountPercentage"],
    discountMaxAmt: json["discountMaxAmt"],
    productId: json["productId"],
    storeId: json["storeId"],
    ownerId: json["ownerId"],
    authorId: json["authorId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    owner: OwnerEntity.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "objectType": objectType,
    "giftType": giftType,
    "totalUsed": totalUsed,
    "pointValue": pointValue,
    "isAlwaysApply": isAlwaysApply,
    "status": status,
    "title": title,
    "code": code,
    "description": description,
    "startDate": startDate,
    "endDate": endDate,
    "orderAmt": orderAmt,
    "thumbnail": thumbnail,
    "discountPercentage": discountPercentage,
    "discountMaxAmt": discountMaxAmt,
    "productId": productId,
    "storeId": storeId,
    "ownerId": ownerId,
    "authorId": authorId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "owner": owner.toJson(),
  };
}

