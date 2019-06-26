import 'package:bloc/bloc.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/provider/CouponProvider.dart';
import 'package:your_reward_user/repository/CouponRepo.dart';
import 'package:your_reward_user/repository/StoreRepo.dart';
import 'package:your_reward_user/repository/TransactionRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';
import 'membership_detail_event.dart';
import 'membership_detail_state.dart';

class MemberShipDetailBloc extends Bloc<MemberShipDetailEvent, MemberShipDetailBaseState> {
  StoreRepo _storeRepo;
  CouponRepo _couponRepo;


  MemberShipDetailBloc() {
    this._storeRepo = StoreRepo();
    this._couponRepo = CouponRepo();
  }

  @override
  Stream<MemberShipDetailBaseState> mapEventToState(
      MemberShipDetailEvent event) async* {
    if (event is GetMemberShipDetailEvent) {
      yield* _handleGetStoreRequest();
    }
    if (event is GetVoucherEvent){
      yield* _handleGetCouponRequest();
    }
  }

  @override
  MemberShipDetailBaseState get initialState => InitialState();

  Stream<MemberShipDetailBaseState> _handleGetStoreRequest() async* {
    yield GetMemmberShipDetailState.isLoading();
    try {
      Pair<STATE, List<Store>> result = await _storeRepo.getStores();
      if (result.left == STATE.ERROR) {
        yield GetMemmberShipDetailState.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetMemmberShipDetailState.empty();
      }
      if (result.left == STATE.SUCCESS) {
        yield OngetMemberShipDetailSuccessState(result.right);
      }
    } catch (e) {
      yield GetMemmberShipDetailState.isError(errMsg: e.toString());
    }
  }

  Stream<MemberShipDetailBaseState> _handleGetCouponRequest() async* {
    yield GetCouponState.isLoading();
    try {
      Pair<STATE, List<Coupon>> result = await _couponRepo.getCoupons();
      if (result.left == STATE.ERROR) {
        yield GetCouponState.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetCouponState.empty();
      }
      if (result.left == STATE.SUCCESS) {
        yield OngetGetCouponSuccessState(result.right);
      }
    } catch (e) {
      yield GetCouponState.isError(errMsg: e.toString());
    }
  }
}
