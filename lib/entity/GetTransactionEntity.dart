// To parse this JSON data, do
//
//     final getTransactionEntity = getTransactionEntityFromJson(jsonString);

import 'dart:convert';

import 'TransactionEntity.dart';

class GetTransactionEntity {
  int total;
  int limit;
  int skip;
  List<TransactionEntity> data;

  GetTransactionEntity({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  factory GetTransactionEntity.fromRawJson(String str) =>
      GetTransactionEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetTransactionEntity.fromJson(Map<String, dynamic> json) =>
      new GetTransactionEntity(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        data: new List<TransactionEntity>.from(
            json["data"].map((x) => TransactionEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'GetTransactionEntity{total: $total, limit: $limit, skip: $skip, data: $data}';
  }


}
