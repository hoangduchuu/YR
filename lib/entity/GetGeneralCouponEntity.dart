// To parse this JSON data, do
//
//     final getGeneralCouponEntity = getGeneralCouponEntityFromJson(jsonString);

import 'dart:convert';



import 'CouponEntity.dart';

class GetGeneralCouponEntity {
  int total;
  int limit;
  int skip;
  List<CouponEntity> data;

  GetGeneralCouponEntity({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  factory GetGeneralCouponEntity.fromRawJson(String str) => GetGeneralCouponEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetGeneralCouponEntity.fromJson(Map<String, dynamic> json) => new GetGeneralCouponEntity(
    total: json["total"],
    limit: json["limit"],
    skip: json["skip"],
    data: new List<CouponEntity>.from(json["data"].map((x) => CouponEntity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "limit": limit,
    "skip": skip,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'GetGeneralCouponEntity{total: $total, limit: $limit, skip: $skip, data: $data}';
  }

}




