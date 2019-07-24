import 'dart:convert';

import '../AuthorEntity.dart';
import '../CouponEntity.dart';
import '../OwnerEntity.dart';
import '../enums.dart';
import '../userEntity.dart';

class NotificationDataEntity {
  int points;
  String ownerId;
  String title;
  String description;
  String thumbnail;
  String storeId;
  String userId;
  String phone;
  int amt;
  int payAmt;
  String objectType;
  String objectId;
  List<String> myCouponIds;
  dynamic code;
  String authorId;
  String id;
  bool isAlwaysApply;
  String status;
  int countUsed;
  int totalUsed;
  String giftType;
  String pointValue;
  DateTime startDate;
  DateTime endDate;
  String orderAmt;
  String discountPercentage;
  String discountMaxAmt;
  String productId;
  DateTime updatedAt;
  int v;
  String couponId;
  DateTime createdAt;
  AuthorEntity author;
  CouponEntity coupon;
  UserEntity user;
  OwnerEntity owner;
  Gender gender;
  Role role;
  bool isNotificationEmail;
  bool isNotificationApplication;
  bool isNotificationPromotion;
  bool isNotificationEvent;
  bool isProfile;
  String email;
  String fullname;

  NotificationDataEntity({
    this.points,
    this.ownerId,
    this.title,
    this.description,
    this.thumbnail,
    this.storeId,
    this.userId,
    this.phone,
    this.amt,
    this.payAmt,
    this.objectType,
    this.objectId,
    this.myCouponIds,
    this.code,
    this.authorId,
    this.id,
    this.isAlwaysApply,
    this.status,
    this.countUsed,
    this.totalUsed,
    this.giftType,
    this.pointValue,
    this.startDate,
    this.endDate,
    this.orderAmt,
    this.discountPercentage,
    this.discountMaxAmt,
    this.productId,
    this.updatedAt,
    this.v,
    this.couponId,
    this.createdAt,
    this.author,
    this.coupon,
    this.user,
    this.owner,
    this.gender,
    this.role,
    this.isNotificationEmail,
    this.isNotificationApplication,
    this.isNotificationPromotion,
    this.isNotificationEvent,
    this.isProfile,
    this.email,
    this.fullname,
  });

  factory NotificationDataEntity.fromRawJson(String str) => NotificationDataEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationDataEntity.fromJson(Map<String, dynamic> json) => new NotificationDataEntity(
        points: json["points"] == null ? null : json["points"],
        ownerId: json["ownerId"] == null ? null : json["ownerId"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        storeId: json["storeId"] == null ? null : json["storeId"],
        userId: json["userId"] == null ? null : json["userId"],
        phone: json["phone"] == null ? null : json["phone"],
        amt: json["amt"] == null ? null : json["amt"],
        payAmt: json["payAmt"] == null ? null : json["payAmt"],
        objectType: json["objectType"] == null ? null : json["objectType"],
        objectId: json["objectId"] == null ? null : json["objectId"],
        myCouponIds: json["myCouponIds"] == null ? null : new List<String>.from(json["myCouponIds"].map((x) => x)),
        code: json["code"],
        authorId: json["authorId"] == null ? null : json["authorId"],
        id: json["_id"] == null ? null : json["_id"],
        isAlwaysApply: json["isAlwaysApply"] == null ? null : json["isAlwaysApply"],
        status: json["status"] == null ? null : json["status"],
        countUsed: json["countUsed"] == null ? null : json["countUsed"],
        totalUsed: json["totalUsed"] == null ? null : json["totalUsed"],
        giftType: json["giftType"] == null ? null : json["giftType"],
        pointValue: json["pointValue"] == null ? null : json["pointValue"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        orderAmt: json["orderAmt"] == null ? null : json["orderAmt"],
        discountPercentage: json["discountPercentage"] == null ? null : json["discountPercentage"],
        discountMaxAmt: json["discountMaxAmt"] == null ? null : json["discountMaxAmt"],
        productId: json["productId"] == null ? null : json["productId"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        couponId: json["couponId"] == null ? null : json["couponId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        author: json["author"] == null ? null : AuthorEntity.fromJson(json["author"]),
        coupon: json["coupon"] == null ? null : CouponEntity.fromJson(json["coupon"]),
        user: json["user"] == null ? null : UserEntity.fromJson(json["user"]),
        owner: json["owner"] == null ? null : OwnerEntity.fromJson(json["owner"]),
        gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
        role: json["role"] == null ? null : roleValues.map[json["role"]],
        isNotificationEmail: json["isNotificationEmail"] == null ? null : json["isNotificationEmail"],
        isNotificationApplication: json["isNotificationApplication"] == null ? null : json["isNotificationApplication"],
        isNotificationPromotion: json["isNotificationPromotion"] == null ? null : json["isNotificationPromotion"],
        isNotificationEvent: json["isNotificationEvent"] == null ? null : json["isNotificationEvent"],
        isProfile: json["isProfile"] == null ? null : json["isProfile"],
        email: json["email"] == null ? null : json["email"],
        fullname: json["fullname"] == null ? null : json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "points": points == null ? null : points,
        "ownerId": ownerId == null ? null : ownerId,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "storeId": storeId == null ? null : storeId,
        "userId": userId == null ? null : userId,
        "phone": phone == null ? null : phone,
        "amt": amt == null ? null : amt,
        "payAmt": payAmt == null ? null : payAmt,
        "objectType": objectType == null ? null : objectType,
        "objectId": objectId == null ? null : objectId,
        "myCouponIds": myCouponIds == null ? null : new List<dynamic>.from(myCouponIds.map((x) => x)),
        "code": code,
        "authorId": authorId == null ? null : authorId,
        "_id": id == null ? null : id,
        "isAlwaysApply": isAlwaysApply == null ? null : isAlwaysApply,
        "status": status == null ? null : status,
        "countUsed": countUsed == null ? null : countUsed,
        "totalUsed": totalUsed == null ? null : totalUsed,
        "giftType": giftType == null ? null : giftType,
        "pointValue": pointValue == null ? null : pointValue,
        "startDate": startDate == null ? null : startDate.toIso8601String(),
        "endDate": endDate == null ? null : endDate.toIso8601String(),
        "orderAmt": orderAmt == null ? null : orderAmt,
        "discountPercentage": discountPercentage == null ? null : discountPercentage,
        "discountMaxAmt": discountMaxAmt == null ? null : discountMaxAmt,
        "productId": productId == null ? null : productId,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "couponId": couponId == null ? null : couponId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "author": author == null ? null : author.toJson(),
        "coupon": coupon == null ? null : coupon.toJson(),
        "user": user == null ? null : user.toJson(),
        "owner": owner == null ? null : owner.toJson(),
        "gender": gender == null ? null : genderValues.reverse[gender],
        "role": role == null ? null : roleValues.reverse[role],
        "isNotificationEmail": isNotificationEmail == null ? null : isNotificationEmail,
        "isNotificationApplication": isNotificationApplication == null ? null : isNotificationApplication,
        "isNotificationPromotion": isNotificationPromotion == null ? null : isNotificationPromotion,
        "isNotificationEvent": isNotificationEvent == null ? null : isNotificationEvent,
        "isProfile": isProfile == null ? null : isProfile,
        "email": email == null ? null : email,
        "fullname": fullname == null ? null : fullname,
      };
}
