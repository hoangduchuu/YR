import 'package:your_reward_user/entity/GetMemberShipEntity.dart';
import 'package:your_reward_user/entity/LevelEntity.dart';
import 'package:your_reward_user/entity/MembershipEntity.dart';
import 'package:your_reward_user/entity/OwnerEntity.dart';
import 'package:your_reward_user/entity/userEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

import 'User.dart';

class MembershipCard {
  String id;
  int points;
  int accumulationPoints;
  String userId;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;
  String levelId;
  User user;
  String ownerStoreName;
  Level level;
  String levelName;
  String iconName;
  String levelDescription;
  String img;

  @override
  String toString() {
    return 'MembershipCard{id: $id, points: $points, accumulationPoints: $accumulationPoints, userId: $userId, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, levelId: $levelId, user: $user, ownerStoreName: $ownerStoreName, level: $level, levelName: $levelName, iconName: $iconName, levelDescription: $levelDescription}';
  }
}

class MembershipCardMapper
    extends BaseMapper<MembershipCard, MembershipEntity> {
  @override
  MembershipCard mapFrom(MembershipEntity entity) {
    MembershipCard model = MembershipCard();
    model.id = entity.id;
    model.points = entity.points;
    model.accumulationPoints = entity.accumulationPoints;
    model.userId = entity.userId;
    model.ownerId = entity.ownerId;
    model.createdAt = entity.createdAt;
    model.updatedAt = entity.updatedAt;
    model.ownerStoreName = entity.ownerStoreName;
    model.level = entity.level;
    model.levelDescription = entity.levelDescription;
    model.iconName = entity.iconName;
    model.levelName = entity.levelName;
    model.img = "https://i-vnexpress.vnecdn.net/2019/06/27/thi-sinh-ha-noi-2153-1561571038_r_500x300.jpg";
    return model;
  }

  @override
  MembershipEntity mapTo(MembershipCard model) {}
}
