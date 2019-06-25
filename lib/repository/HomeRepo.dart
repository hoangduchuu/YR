import 'package:your_reward_user/entity/LoginEntity.dart';
import 'package:your_reward_user/entity/RespErrorEntity.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/provider/AuthProvider.dart';
import 'package:your_reward_user/provider/CouponProvider.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'DataProvider.dart';

class HomeRepo {
  CouponRepo _couponRepo;

  HomeRepo() {
    this._couponRepo = CouponRepo();
  }

  // request and mapping from entity to model
  Future<Pair<STATE, User>> getStore(String email, String password) async {
    try {
      var result = await _couponRepo.getStores(DataProvider.user.id);
      if (result is ErrorEntity && result.code != null) {
        return Pair(STATE.ERROR, null, erroMsg: 'Lỗi: ${result.message}');
      }
      if (result is LoginEntity) {
        if (result.accessToken == null || result.accessToken.isEmpty) {
          return Pair(STATE.ERROR, null, erroMsg: "Token Invalid");
        } else {
          SharedPrefRepo.saveToken(result.accessToken);
          DataProvider.provideData(result);
          return Pair(STATE.SUCCESS, DataProvider.user);
        }
      }
    } catch (e) {
      return Pair(STATE.ERROR, null, erroMsg: e.toString());
    }
  }
}
