// To parse this JSON data, do
//
//     final createPostRequest = createPostRequestFromJson(jsonString);

import 'dart:convert';

class CreatePostRequest {
  String objectType;
  String status;
  String title;
  String code;
  String description;
  String thumbnail;

  CreatePostRequest({
    this.objectType,
    this.status,
    this.title,
    this.code,
    this.description,
    this.thumbnail,
  });

  factory CreatePostRequest.fromRawJson(String str) => CreatePostRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) => new CreatePostRequest(
    objectType: json["objectType"],
    status: json["status"],
    title: json["title"],
    code: json["code"],
    description: json["description"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "objectType": objectType,
    "status": status,
    "title": title,
    "code": code,
    "description": description,
    "thumbnail": thumbnail,
  };
}
