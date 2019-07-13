import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/model/Transaction.dart';

import 'home_state.dart';

class OnGetTransactionSuccess extends HomeState {
  List<Transaction> transactions;

  OnGetTransactionSuccess({this.transactions}) : super([transactions]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}

class GetTransactionState extends HomeState {
  final bool isLoading;
  final bool isError;
  String errMsg;

  GetTransactionState({this.isLoading, this.isError, this.errMsg})
      : super([isLoading, isError, errMsg]);

  factory GetTransactionState.empty() {
    return GetTransactionState(
      isLoading: false,
      isError: false,
    );
  }

  factory GetTransactionState.isLoading() {
    return GetTransactionState(
      isLoading: true,
      isError: false,
    );
  }

  factory GetTransactionState.isError({String errMsg}) {
    return GetTransactionState(isLoading: false, isError: true, errMsg: errMsg);
  }
}