import 'dart:convert';

import 'package:your_reward_user/entity/userEntity.dart';

import 'LevelEntity.dart';
import 'OwnerEntity.dart';

// TODO: HUU remove un-used parameter or mapping new needed parameter
class MembershipEntity {
  String id;
  int points;
  int accumulationPoints;
  String userId;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String levelId;
  UserEntity user;
  OwnerEntity owner;
  Level level;
  String levelName;
  String iconName;
  String levelDescription;

  MembershipEntity(
      {this.id,
      this.points,
      this.accumulationPoints,
      this.userId,
      this.ownerId,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.levelId,
      this.user,
      this.owner,
      this.level,
      this.levelName,
      this.iconName,
      this.levelDescription});

  factory MembershipEntity.fromRawJson(String str) => MembershipEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MembershipEntity.fromJson(Map<String, dynamic> json) {
    print('MembershipEntity fromJson');
    return new MembershipEntity(
      id: json["_id"],
      points: json["points"],
      accumulationPoints: json["accumulationPoints"],
      userId: json["userId"],
      ownerId: json["ownerId"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
      levelId: json["levelId"] == null ? null : json["levelId"],
      user: UserEntity.fromJson(json["user"]),
      owner: json["owner"]["_id"] == null ? null : OwnerEntity.fromJson(json["owner"]),
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
      levelName: json["level"] == null ? null : Level.fromJson(json["level"]).title,
      iconName: json["level"] == null ? null : Level.fromJson(json["level"]).iconName,
      levelDescription: json["level"] == null ? null : Level.fromJson(json["level"]).description,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "points": points,
        "accumulationPoints": accumulationPoints,
        "userId": userId,
        "ownerId": ownerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "levelId": levelId == null ? null : levelId,
        "user": user.toJson(),
        "owner": owner.toJson(),
        "level": level == null ? null : level.toJson(),
      };

  @override
  String toString() {
    return 'H  MembershipEntity{id: $id, points: $points, accumulationPoints: $accumulationPoints, userId: $userId, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, levelId: $levelId, user: $user, owner: $owner, level: $level, levelName: $levelName, iconName: $iconName, levelDescription: $levelDescription}';
  }
}
