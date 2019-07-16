import 'dart:convert';

class Level {
  String id;
  String objectType;
  String status;
  int points;
  List<String> coupons;
  String iconName;
  String title;
  String description;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String thumbnail;

  Level({
    this.id,
    this.objectType,
    this.status,
    this.points,
    this.coupons,
    this.iconName,
    this.title,
    this.description,
    this.ownerId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.thumbnail,
  });

  factory Level.fromRawJson(String str) => Level.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Level.fromJson(Map<String, dynamic> json) => new Level(
        id: json["_id"],
        objectType: json["objectType"],
        status: json["status"],
        points: json["points"],
        coupons: new List<String>.from(json["coupons"].map((x) => x == null ? null : x)),
        iconName: json["iconName"],
        title: json["title"],
        description: json["description"],
        ownerId: json["ownerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "objectType": objectType,
        "status": status,
        "points": points,
        "coupons": new List<dynamic>.from(coupons.map((x) => x == null ? null : x)),
        "iconName": iconName,
        "title": title,
        "description": description,
        "ownerId": ownerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "thumbnail": thumbnail == null ? null : thumbnail,
      };
}
