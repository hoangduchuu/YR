// To parse this JSON data, do
//
//     final getMemberShipEntity = getMemberShipEntityFromJson(jsonString);

import 'dart:convert';

import 'MembershipEntity.dart';

class GetMemberShipEntity {
  int total;
  int limit;
  int skip;
  List<MembershipEntity> data;

  GetMemberShipEntity({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  factory GetMemberShipEntity.fromRawJson(String str) => GetMemberShipEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetMemberShipEntity.fromJson(Map<String, dynamic> json) => new GetMemberShipEntity(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        data: new List<MembershipEntity>.from(json["data"].map((x) => MembershipEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'GetMemberShipEntity{total: $total, limit: $limit, skip: $skip, data: $data}';
  }
}
