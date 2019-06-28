import 'package:bloc/bloc.dart';
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

class HomeBLoc extends Bloc<HomeEvent, HomeState> {
  StoreRepo _storeRepo;
  TransactionRepo _transactionRepo;
  CouponRepo _couponRepo;

  HomeBLoc() {
    this._storeRepo = StoreRepo();
    this._transactionRepo = new TransactionRepo();
    this._couponRepo = new CouponRepo();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetMemberShipCardsRequest) {
      yield* _handleHomeRequest(event.userId);
    }
    if (event is GetTransactionRequest) {
      yield* _HandleGetTransactionRequest();
    }
  }

  @override
  HomeState get initialState => InitialState();

  Stream<HomeState> _handleHomeRequest(String userID) async* {
    yield GetMemberShipCards.isLoading();
    try {
      Pair<STATE, List<MembershipCard>> result =
          await _couponRepo.getMembership(userID);
      if (result.left == STATE.ERROR) {
        yield GetMemberShipCards.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetMemberShipCards.empty();
      }
      if (result.left == STATE.SUCCESS) {
        yield GetMembershipCardSuccessState(memberships: result.right);
      }
    } catch (e) {
      yield GetMemberShipCards.isError(errMsg: e.toString());
    }
  }

  Stream<HomeState> _HandleGetTransactionRequest() async* {
    yield GetTransactionState.isLoading();
    try {
      Pair<STATE, List<Transaction>> result =
          await _transactionRepo.getTransactions();
      if (result.left == STATE.ERROR) {
        yield GetTransactionState.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetTransactionState.empty();
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetTransactionSuccess(transactions: result.right);
      }
    } catch (e) {
      yield GetTransactionState.isError(errMsg: e.toString());
    }
  }
}
