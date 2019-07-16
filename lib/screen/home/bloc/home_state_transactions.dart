import 'package:your_reward_user/model/Transaction.dart';

import 'home_state.dart';

class OnGetTransactionSuccess extends HomeState {
  final List<Transaction> transactions;

  OnGetTransactionSuccess({this.transactions}) : super([transactions]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}

class GetTransactionEmptyState extends HomeState {
  @override
  String toString() {
    return 'GetTransactionEmptyState{}';
  }
}
