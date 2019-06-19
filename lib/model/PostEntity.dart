import 'dart:convert';

import 'package:your_reward_user/model/Author.dart';

class PostEntity {
  String id;
  String objectType;
  String status;
  String title;
  String code;
  String description;
  String thumbnail;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String authorId;
  AuthorEntity author;

  PostEntity({
    this.id,
    this.objectType,
    this.status,
    this.title,
    this.code,
    this.description,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.authorId,
    this.author,
  });

  factory PostEntity.fromRawJson(String str) =>
      PostEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostEntity.fromJson(Map<String, dynamic> json) => new PostEntity(
        id: json["_id"],
        objectType: json["objectType"],
        status: json["status"],
        title: json["title"],
        code: json["code"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        authorId: json["authorId"] == null ? null : json["authorId"],
        author: json["author"] == null ? null : AuthorEntity.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "objectType": objectType,
        "status": status,
        "title": title,
        "code": code,
        "description": description,
        "thumbnail": thumbnail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "authorId": authorId == null ? null : authorId,
        "author": author == null ? null : author.toJson(),
      };

  @override
  String toString() {
    return 'PostEntity{id: $id, objectType: $objectType, status: $status, title: $title, code: $code, description: $description, thumbnail: $thumbnail, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, authorId: $authorId, author: $author}';
  }


}
