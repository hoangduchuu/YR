import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';

@immutable
abstract class MemberShipDetailBaseState extends BaseBlocState {
  MemberShipDetailBaseState([List props = const []]) : super(props);

  @override
  String toString() {
    return 'MemberShipDetailBaseState{}';
  }
}

class InitialState extends MemberShipDetailBaseState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}

class OnGetMemberShipDetailSuccessState extends MemberShipDetailBaseState {
  List<Store> stores;

  OnGetMemberShipDetailSuccessState(this.stores);

  @override
  String toString() {
    return 'OngetMemberShipDetailSuccessState{stores: $stores}';
  }
}

class GetMemberShipDetailSuccessState extends MemberShipDetailBaseState {
  final List<Store> stores;

  GetMemberShipDetailSuccessState(this.stores) : super([stores]);

  @override
  String toString() {
    return 'GetMemberShipDetailSuccessState{stores: $stores}';
  }
}

/// Start get Couopon
class OnGetCouponSuccessState extends MemberShipDetailBaseState {
  final List<Coupon> coupons;

  OnGetCouponSuccessState(this.coupons) : super([coupons]);
}

class GetCouponSuccessState extends MemberShipDetailBaseState {
  final List<Store> stores;

  GetCouponSuccessState(this.stores) : super([stores]);
}

/// END GET COUPON
