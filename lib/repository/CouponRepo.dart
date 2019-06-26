import 'package:your_reward_user/entity/GetGeneralCouponEntity.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/provider/CouponProvider.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';


class CouponRepo {
  CouponProvider _provider;
  CouponMapper _mapper;

  CouponRepo() {
    this._provider = CouponProvider();
    this._mapper = CouponMapper();
  }

  // request and mapping from entity to model
  Future<Pair<STATE, List<Coupon>>> getCoupons() async {
    try {
      var result = await _provider.getCoupons();
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is GetGeneralCouponEntity) {
        List<Coupon> stores = List<Coupon>();
        result.data.forEach((it) {
          stores.add(_mapper.mapFrom(it));
        });
        return Pair(STATE.SUCCESS, stores);
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }
}
