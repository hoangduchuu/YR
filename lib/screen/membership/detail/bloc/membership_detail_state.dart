import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';

@immutable
abstract class MemberShipDetailBaseState extends Equatable {
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

class OngetMemberShipDetailSuccessState extends MemberShipDetailBaseState {
  List<Store> stores;

  OngetMemberShipDetailSuccessState(this.stores);

  @override
  String toString() {
    return 'OngetMemberShipDetailSuccessState{stores: $stores}';
  }

}

class GetMemmberShipDetailState extends MemberShipDetailBaseState {
   bool isLoading;
  final bool isError;
  String errMsg;
  List<Store> stores;

  GetMemmberShipDetailState({this.stores, this.isLoading, this.isError, this.errMsg})
      : super([isLoading, isError, errMsg]);

  factory GetMemmberShipDetailState.empty() {
    return GetMemmberShipDetailState(
      isLoading: false,
      isError: false,
    );
  }

  factory GetMemmberShipDetailState.isLoading() {
    return GetMemmberShipDetailState(
      isLoading: true,
      isError: false,
    );
  }

  factory GetMemmberShipDetailState.isError({String errMsg}) {
    return GetMemmberShipDetailState(
        isLoading: false, isError: true, errMsg: errMsg);
  }

  factory GetMemmberShipDetailState.success(List<Store> data) {
    return GetMemmberShipDetailState(stores: data);
  }
}

/// Start get Couopon
class OngetGetCouponSuccessState extends MemberShipDetailBaseState {
  List<Coupon> coupons;

  OngetGetCouponSuccessState(this.coupons);
}

class GetCouponState extends MemberShipDetailBaseState {
  final bool isLoading = false;
  final bool isError = false;
  String errMsg;
  List<Store> stores;

  GetCouponState({this.stores, isLoading, isError, this.errMsg})
      : super([isLoading, isError, errMsg]);

  factory GetCouponState.empty() {
    return GetCouponState(
      isLoading: false,
      isError: false,
    );
  }

  factory GetCouponState.isLoading() {
    return GetCouponState(
      isLoading: true,
      isError: false,
    );
  }

  factory GetCouponState.isError({String errMsg}) {
    return GetCouponState(isLoading: false, isError: true, errMsg: errMsg);
  }

  factory GetCouponState.success(List<Store> data) {
    return GetCouponState(stores: data);
  }
}
/// END GET COUPON
