import 'package:your_reward_user/entity/GetMemberShipEntity.dart';
import 'package:your_reward_user/entity/MembershipEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class MembershipCard{
  String id;
  int point;
  String joinedDate;
  int usedCount;
  String memberName;
  String level;
}

class MembershipCardMapper extends BaseMapper<MembershipCard, MembershipEntity>{

  @override
  MembershipCard mapFrom(MembershipEntity entity) {
    MembershipCard model = MembershipCard();
    model.id = entity.id;
    model.point = entity.points;
    model.joinedDate = entity.createdAt.toString();
    model.usedCount = entity.accumulationPoints;
    model.memberName = entity.ownerStoreName;
  }

  @override
  MembershipEntity mapTo(MembershipCard model) {

  }
}