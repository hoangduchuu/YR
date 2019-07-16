import 'package:bloc/bloc.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/repository/CouponRepo.dart';
import 'package:your_reward_user/repository/StoreRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'membership_detail_event.dart';
import 'membership_detail_state.dart';

class MemberShipDetailBloc extends Bloc<MemberShipDetailEvent, BaseBlocState> {
  StoreRepo _storeRepo = injector<StoreRepo>();
  CouponRepo _couponRepo = injector<CouponRepo>();

  @override
  Stream<BaseBlocState> mapEventToState(MemberShipDetailEvent event) async* {
    if (event is GetMemberShipDetailEvent) {
      yield* _handleGetStoreRequest(event.ownerId);
    }
    if (event is GetVoucherEvent) {
      yield* _handleGetCouponRequest(event.userId, event.ownerId);
    }
  }

  @override
  MemberShipDetailBaseState get initialState => InitialState();

  Stream<BaseBlocState> _handleGetStoreRequest(String ownerId) async* {
    yield UIControlState.showLoading();
    try {
      Pair<STATE, List<Store>> result = await _storeRepo.getStoresByStoreId(ownerId);
      if (result.left == STATE.ERROR) {
        yield UIControlState.showError(result.erroMsg);
      } else if (result.right.isEmpty) {
        yield OnGetMemberShipDetailSuccessState(List());
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetMemberShipDetailSuccessState(result.right);
      }
    } catch (e) {
      yield UIControlState.showError(e.toString());
    }
  }

  Stream<BaseBlocState> _handleGetCouponRequest(String userId, String ownerId) async* {
    yield UIControlState.showLoading();
    try {
      Pair<STATE, List<Coupon>> result = await _couponRepo.getCoupons(userId, ownerId);
      if (result.left == STATE.ERROR) {
        yield UIControlState.showError(result.erroMsg);
      } else if (result.right.isEmpty) {
        yield OnGetCouponSuccessState(List());
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetCouponSuccessState(result.right);
      }
    } catch (e) {
      yield UIControlState.showError(e.toString());
    }
  }
}
