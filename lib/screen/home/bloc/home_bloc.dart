import 'package:bloc/bloc.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/model/Transaction.dart';
import 'package:your_reward_user/repository/CouponRepo.dart';
import 'package:your_reward_user/repository/StoreRepo.dart';
import 'package:your_reward_user/repository/TransactionRepo.dart';
import 'package:your_reward_user/utils/app_state.dart';
import 'package:your_reward_user/utils/pair.dart';

import 'home_state_stores.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'home_state_transactions.dart';

class HomeBLoc extends Bloc<HomeEvent, BaseBlocState> {
  TransactionRepo _transactionRepo;
  CouponRepo _couponRepo = injector<CouponRepo>();

  HomeBLoc() {
    this._transactionRepo = new TransactionRepo();
  }

  @override
  Stream<BaseBlocState> mapEventToState(HomeEvent event) async* {
    if (event is GetMemberShipCardsRequest) {
      yield* _handleHomeRequest(event.userId);
    }
    if (event is GetTransactionRequest) {
      yield* _handleGetTransactionRequest(event.userId);
    }
  }

  @override
  HomeState get initialState => InitialState();

  Stream<BaseBlocState> _handleHomeRequest(String userID) async* {
    yield UIControlState.showLoading();
    try {
      Pair<STATE, List<MembershipCard>> result =
          await _couponRepo.getMembership(userID);
      if (result.left == STATE.ERROR) {
        yield UIControlState.showError(result.erroMsg);
      }
      if (result.right.isEmpty) {
        yield GetMemberShipCardsEmptyState();
      }else{
        if (result.left == STATE.SUCCESS) {
          yield GetMembershipCardSuccessState(memberships: result.right);
        }
      }

    } catch (e) {
      yield UIControlState.showError( e.toString());
    }
  }

  Stream<BaseBlocState> _handleGetTransactionRequest(String userId) async* {
    yield UIControlState.showLoading();
    try {
      Pair<STATE, List<Transaction>> result =
          await _transactionRepo.getTransactions(userId);
      if (result.left == STATE.ERROR) {
        yield UIControlState.showError(result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetTransactionEmptyState();
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetTransactionSuccess(transactions: result.right);
      }
    } catch (e) {
      yield  UIControlState.showError(e.toString());
    }
  }
}
