import 'package:your_reward_user/entity/CouponEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class Coupon{
  String title;
  String endDate;
  String image;
  String code;
  String status;
  String description;
}

class CouponMapper extends BaseMapper<Coupon, CouponEntity>{

  @override
  Coupon mapFrom(CouponEntity entity) {
    Coupon model = Coupon();
    model.title = entity.title;
    model.code = entity.code;
    model.status = entity.status.toString();
    model.description = entity.description;
    model.endDate ="Chua co API";
    return model;
  }

  @override
  CouponEntity mapTo(Coupon model) {

  }
}