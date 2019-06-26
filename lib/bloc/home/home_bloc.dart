import 'package:bloc/bloc.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/model/Transaction.dart';
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

  HomeBLoc() {
    this._storeRepo = StoreRepo();
    this._transactionRepo = new TransactionRepo();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetStoreRequest) {
      yield* _handleHomeRequest();
    }
    if(event is GetTransactionRequest){
      yield* _HandleGetTransactionRequest();
    }
  }

  @override
  HomeState get initialState => GetStoresState.isLoading();

  Stream<HomeState> _handleHomeRequest() async* {
    yield GetStoresState.isLoading();
    try {
      Pair<STATE, List<Store>> result = await _storeRepo.getStores();
      if (result.left == STATE.ERROR) {
        yield GetStoresState.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetStoresState.empty();
      }
      if (result.left == STATE.SUCCESS) {
        yield OnGetStoresSuccess(stores: result.right);
      }
    } catch (e) {
      yield GetStoresState.isError(errMsg: e.toString());
    }
  }

  Stream<HomeState> _HandleGetTransactionRequest() async* {
    yield GetTransactionState.isLoading();
    try {
      Pair<STATE, List<Transaction>> result = await _transactionRepo.getTransactions();
      if (result.left == STATE.ERROR) {
        yield GetTransactionState.isError(errMsg: result.erroMsg);
      } else if (result.right.isEmpty) {
        yield GetTransactionState.empty();
      }
      if (result.left == STATE.SUCCESS) {
        print(" HOME BLOC: _HandleGetTransactionRequest SUCCESS");
        yield OnGetTransactionSuccess(transactions: result.right);
      }
    } catch (e) {
      yield GetTransactionState.isError(errMsg: e.toString());
    }
  }}
