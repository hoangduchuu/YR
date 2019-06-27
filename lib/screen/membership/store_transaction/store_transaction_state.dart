
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/model/Transaction.dart';

@immutable
abstract class StoreTransactionBaseState extends Equatable {
  StoreTransactionBaseState([List props = const []]) : super(props);
}

class InitialState extends StoreTransactionBaseState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}

class OnGetTransactionSuccess extends StoreTransactionBaseState {
  List<Transaction> transactions;

  OnGetTransactionSuccess({this.transactions}) : super([transactions]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}

class GetTransactionState extends StoreTransactionBaseState {
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
