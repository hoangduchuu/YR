// To parse this JSON data, do
//
//     final getNotificationEntity = getNotificationEntityFromJson(jsonString);

import 'dart:convert';

import 'package:your_reward_user/entity/notification/notification_entity.dart';

class GetNotificationEntity {
  int total;
  int limit;
  int skip;
  List<NotificationEntity> data;

  GetNotificationEntity({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  factory GetNotificationEntity.fromRawJson(String str) => GetNotificationEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetNotificationEntity.fromJson(Map<String, dynamic> json) => new GetNotificationEntity(
        total: json["total"] == null ? null : json["total"],
        limit: json["limit"] == null ? null : json["limit"],
        skip: json["skip"] == null ? null : json["skip"],
        data: json["data"] == null
            ? null
            : new List<NotificationEntity>.from(json["data"].map((x) => NotificationEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "limit": limit == null ? null : limit,
        "skip": skip == null ? null : skip,
        "data": data == null ? null : new List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'GetNotificationEntity{total: $total, limit: $limit, skip: $skip, data: $data}';
  }
}
