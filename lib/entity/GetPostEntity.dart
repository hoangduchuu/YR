// To parse this JSON data, do
//
//     final getPostEntity = getPostEntityFromJson(jsonString);

import 'dart:convert';

import 'PostEntity.dart';

class GetPostEntity {
  int total;
  int limit;
  int skip;
  List<PostEntity> data;

  GetPostEntity({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  factory GetPostEntity.fromRawJson(String str) => GetPostEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetPostEntity.fromJson(Map<String, dynamic> json) => new GetPostEntity(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        data: new List<PostEntity>.from(json["data"].map((x) => PostEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'GetPostEntity{total: $total, limit: $limit, skip: $skip, data: $data}';
  }
}
