import 'dart:convert';

import 'AuthorEntity.dart';
import 'StoreEntity.dart';
import 'enums.dart';

class CouponEntity {
  String id;
  String objectType;
  String giftType;
  int totalUsed;
  String pointValue;
  bool isAlwaysApply;
  Status status;
  String title;
  String code;
  String description;
  DateTime startDate;
  DateTime endDate;
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
  AuthorEntity author;
  AuthorEntity owner;
  StoreEntity store;

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
    this.author,
    this.owner,
    this.store,
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
    status: statusValues.map[json["status"]],
    title: json["title"],
    code: json["code"],
    description: json["description"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
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
    author: AuthorEntity.fromJson(json["author"]),
    owner: AuthorEntity.fromJson(json["owner"]),
    store: json["store"] == null ? null : StoreEntity.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "objectType": objectType,
    "giftType": giftType,
    "totalUsed": totalUsed,
    "pointValue": pointValue,
    "isAlwaysApply": isAlwaysApply,
    "status": statusValues.reverse[status],
    "title": title,
    "code": code,
    "description": description,
    "startDate": startDate == null ? null : startDate.toIso8601String(),
    "endDate": endDate == null ? null : endDate.toIso8601String(),
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
    "author": author.toJson(),
    "owner": owner.toJson(),
    "store": store == null ? null : store.toJson(),
  };

  @override
  String toString() {
    return 'CouponEntity{id: $id, objectType: $objectType, giftType: $giftType, totalUsed: $totalUsed, pointValue: $pointValue, isAlwaysApply: $isAlwaysApply, status: $status, title: $title, code: $code, description: $description, startDate: $startDate, endDate: $endDate, orderAmt: $orderAmt, thumbnail: $thumbnail, discountPercentage: $discountPercentage, discountMaxAmt: $discountMaxAmt, productId: $productId, storeId: $storeId, ownerId: $ownerId, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, author: $author, owner: $owner, store: $store}';
  }

}
