import 'dart:convert';

import 'package:your_reward_user/entity/userEntity.dart';

import 'AuthorEntity.dart';
import 'StoreEntity.dart';

class TransactionEntity {
  String id;
  String objectType;
  int amt;
  int payAmt;
  int points;
  String address;
  String status;
  List<dynamic> myCouponIds;
  String title;
  String description;
  String storeId;
  String userId;
  String phone;
  String objectId;
  String ownerId;
  String code;
  String authorId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  AuthorEntity author;
  UserEntity user;
  StoreEntity store;

  TransactionEntity({
    this.id,
    this.objectType,
    this.amt,
    this.payAmt,
    this.points,
    this.address,
    this.status,
    this.myCouponIds,
    this.title,
    this.description,
    this.storeId,
    this.userId,
    this.phone,
    this.objectId,
    this.ownerId,
    this.code,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.author,
    this.user,
    this.store,
  });

  factory TransactionEntity.fromRawJson(String str) => TransactionEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionEntity.fromJson(Map<String, dynamic> json) => new TransactionEntity(
        id: json["_id"],
        objectType: json["objectType"],
        amt: json["amt"],
        payAmt: json["payAmt"],
        points: json["points"],
        address: json["address"],
        status: json["status"],
        myCouponIds: new List<dynamic>.from(json["myCouponIds"].map((x) => x)),
        title: json["title"],
        description: json["description"],
        storeId: json["storeId"],
        userId: json["userId"],
        phone: json["phone"],
        objectId: json["objectId"],
        ownerId: json["ownerId"],
        code: json["code"],
        authorId: json["authorId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        author: AuthorEntity.fromJson(json["author"]),
        user: UserEntity.fromJson(json["user"]),
        store: json["store"] != null ? StoreEntity.fromJson(json["store"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "objectType": objectType,
        "amt": amt,
        "payAmt": payAmt,
        "points": points,
        "address": address,
        "status": status,
        "myCouponIds": new List<dynamic>.from(myCouponIds.map((x) => x)),
        "title": title,
        "description": description,
        "storeId": storeId,
        "userId": userId,
        "phone": phone,
        "objectId": objectId,
        "ownerId": ownerId,
        "code": code,
        "authorId": authorId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "author": author.toJson(),
        "user": user.toJson(),
        "store": store.toJson(),
      };

  @override
  String toString() {
    return 'TransactionEntity{id: $id, objectType: $objectType, amt: $amt, payAmt: $payAmt, points: $points, address: $address, status: $status, myCouponIds: $myCouponIds, title: $title, description: $description, storeId: $storeId, userId: $userId, phone: $phone, objectId: $objectId, ownerId: $ownerId, code: $code, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, author: $author, user: $user, store: $store}';
  }
}
