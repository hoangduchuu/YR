import 'package:your_reward_user/entity/CouponEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/utils/const.dart';

class Coupon {
  String title;
  String endDate;
  String image;
  String code;
  String status;
  String _description;

  @override
  String toString() {
    return 'Coupon{title: $title, endDate: $endDate, image: $image, code: $code, status: $status, _description: $_description}';
  }

  String getDescription() {
    if (_description == null || _description.length <= 1) {
      return "Bạn được nhận khuyến mãi";
    }
    return _description;
  }
}

class CouponMapper extends BaseMapper<Coupon, CouponEntity> {
  @override
  Coupon mapFrom(CouponEntity entity) {
    Coupon model = Coupon();
    model.title = entity.title;
    model.code = entity.code;
    model.image = getThumbnail(entity.thumbnail);
    model.status = entity.status.toString();
    model._description = entity.description;
    model.endDate = entity.endDate != null ? CommonUtils.getDateFormat(entity.endDate) : "Chưa có";
    return model;
  }

  @override
  CouponEntity mapTo(Coupon model) {}

  String getThumbnail(String url) {
    if (url == null || url.isEmpty) {
      return NO_IMAGE;
    }
    return url;
  }
}
