import 'package:your_reward_user/entity/GetMemberShipEntity.dart';
import 'package:your_reward_user/entity/LevelEntity.dart';
import 'package:your_reward_user/entity/MembershipEntity.dart';
import 'package:your_reward_user/entity/OwnerEntity.dart';
import 'package:your_reward_user/entity/userEntity.dart';
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

  @override
  String toString() {
    return 'MembershipCard{id: $id, fullName: $fullName, points: $points, accumulationPoints: $accumulationPoints, userId: $userId, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, levelId: $levelId, user: $user, levelName: $levelName, iconName: $iconName, levelDescription: $levelDescription, img: $img}';
  }


}

class MembershipCardMapper
    extends BaseMapper<MembershipCard, MembershipEntity> {
  @override
  MembershipCard mapFrom(MembershipEntity entity) {
    MembershipCard model = MembershipCard();
    model.id = entity.id;
    model.points = entity.level.points;
    model.accumulationPoints = entity.accumulationPoints;
    model.userId = entity.userId;
    model.ownerId = entity.ownerId;
    model.createdAt = entity.createdAt;
    model.updatedAt = entity.updatedAt;
    model.fullName = entity.user.fullname;
    model.levelDescription = entity.levelDescription;
    model.iconName = entity.iconName;
    model.levelName = entity.level.title;
    model.img = entity.owner.ownerBackground;
    // FIXME: lấy đúng field hoặc API trả về kết quả không đúng
    return model;
  }

  @override
  MembershipEntity mapTo(MembershipCard model) {}
}
