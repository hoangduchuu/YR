import 'dart:convert';

import 'package:your_reward_user/entity/notification/notification_data_entity.dart';

import '../enums.dart';
import '../userEntity.dart';

class NotificationEntity {
  String id;
  String objectType;
  NotificationReadSTATUS status;
  String title;
  String description;
  NotificationDataEntity data;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String userId;
  UserEntity user;
  String objectId;

  NotificationEntity({
    this.id,
    this.objectType,
    this.status,
    this.title,
    this.description,
    this.data,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.userId,
    this.user,
    this.objectId,
  });

  factory NotificationEntity.fromRawJson(String str) => NotificationEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => new NotificationEntity(
        id: json["_id"] == null ? null : json["_id"],
        objectType: json["objectType"] == null ? null : json["objectType"],
        status: json["status"] == null ? null : notificationReadStatusValue.map[json["status"]],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        data: json["data"] == null ? null : NotificationDataEntity.fromJson(json["data"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        userId: json["userId"] == null ? null : json["userId"],
        user: json["user"] == null ? null : UserEntity.fromJson(json["user"]),
        objectId: json["objectId"] == null ? null : json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "objectType": objectType == null ? null : objectType,
        "status": status == null ? null : notificationReadStatusValue.reverse[status],
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "data": data == null ? null : data.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "userId": userId == null ? null : userId,
        "user": user == null ? null : user.toJson(),
        "objectId": objectId == null ? null : objectId,
      };

  @override
  String toString() {
    return 'NotificationEntity{id: $id, objectType: $objectType, status: $status, title: $title, description: $description, data: $data, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, userId: $userId, user: $user, objectId: $objectId}';
  }
}
