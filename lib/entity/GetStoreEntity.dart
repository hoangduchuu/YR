// To parse this JSON data, do
//
//     final getStoreEntity = getStoreEntityFromJson(jsonString);

import 'dart:convert';

import 'StoreEntity.dart';

class GetStoreEntity {
  int total;
  int limit;
  int skip;
  List<StoreEntity> data;

  GetStoreEntity({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  factory GetStoreEntity.fromRawJson(String str) => GetStoreEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetStoreEntity.fromJson(Map<String, dynamic> json) => new GetStoreEntity(
    total: json["total"],
    limit: json["limit"],
    skip: json["skip"],
    data: new List<StoreEntity>.from(json["data"].map((x) => StoreEntity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "limit": limit,
    "skip": skip,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'GetStoreEntity{total: $total, limit: $limit, skip: $skip, data: $data}';
  }

}
