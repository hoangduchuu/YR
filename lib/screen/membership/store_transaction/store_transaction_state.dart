
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_reward_user/bloc/base/base_bloc_state.dart';
import 'package:your_reward_user/model/Transaction.dart';

@immutable
abstract class StoreTransactionBaseState extends BaseBlocState {
  StoreTransactionBaseState([List props = const []]) : super(props);
}

class InitialState extends StoreTransactionBaseState {
  @override
  String toString() {
    return 'InitialState{}';
  }
}

class OnGetTransactionSuccess extends StoreTransactionBaseState {
  final List<Transaction> transactions;

  OnGetTransactionSuccess({this.transactions}) : super([transactions]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}
