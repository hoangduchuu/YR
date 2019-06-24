// To parse this JSON data, do
//
//     final baseEntity = baseEntityFromJson(jsonString);

import 'dart:convert';

class BaseEntity {
  int total;
  int limit;
  int skip;

  BaseEntity({
    this.total,
    this.limit,
    this.skip,
  });

  factory BaseEntity.fromRawJson(String str) => BaseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BaseEntity.fromJson(Map<String, dynamic> json) => new BaseEntity(
    total: json["total"],
    limit: json["limit"],
    skip: json["skip"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "limit": limit,
    "skip": skip,
  };
}
