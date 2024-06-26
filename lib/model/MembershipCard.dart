import 'package:your_reward_user/entity/MembershipEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

import 'User.dart';

class MembershipCard {
  String id;
  String fullName;
  int points;
  int accumulationPoints;
  String userId;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;
  String levelId;
  User user;
  String levelName;
  String iconName;
  String levelDescription;
  String img;
  String logo;
  String ownerName;

  @override
  String toString() {
    return 'MembershipCard{id: $id, fullName: $fullName, points: $points, accumulationPoints: $accumulationPoints, userId: $userId, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, levelId: $levelId, user: $user, levelName: $levelName, iconName: $iconName, levelDescription: $levelDescription, img: $img}';
  }
}

class MembershipCardMapper extends BaseMapper<MembershipCard, MembershipEntity> {
  @override
  MembershipCard mapFrom(MembershipEntity entity) {
    MembershipCard model = MembershipCard();
    model.id = entity.id;
//    model.points = entity.level.points;
    model.points = entity.points; // FIXME UGENT: bị mất field Level
    model.accumulationPoints = entity.accumulationPoints;
    model.userId = entity.userId;
    model.ownerId = entity.ownerId;
    model.createdAt = entity.createdAt;
    model.updatedAt = entity.updatedAt;
    model.fullName = entity.user.fullname;
    model.levelDescription = entity.levelDescription;
    model.iconName = entity.iconName;
    model.logo = entity.owner.ownerLogo;
    model.ownerName = entity.owner.fullname;
    model.levelName = (entity.level == null || entity.level.title == null) ? "Mới đăng ký" : entity.level.title;
    model.img = entity.owner.ownerBackground;
    return model;
  }

  @override
  MembershipEntity mapTo(MembershipCard model) {}
}
