// To parse this JSON data, do
//
//     final uploadEntity = uploadEntityFromJson(jsonString);

import 'dart:convert';

import 'image_entity.dart';

class UploadEntity {
  ImageEntity image;

  UploadEntity({
    this.image,
  });

  factory UploadEntity.fromJson(String str) => UploadEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadEntity.fromMap(Map<String, dynamic> json) => new UploadEntity(
        image: json["image"] == null ? null : ImageEntity.fromMap(json["image"]),
      );

  Map<String, dynamic> toMap() => {
        "image": image == null ? null : image.toMap(),
      };

  @override
  String toString() {
    return 'UploadEntity{image: $image}';
  }
}
