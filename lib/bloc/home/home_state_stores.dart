import 'package:your_reward_user/model/Store.dart';

import 'home_state.dart';

class OnGetStoresSuccess extends HomeState {
  List<Store> stores;

  OnGetStoresSuccess({this.stores}) : super([stores]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}

class GetStoresState extends HomeState {
  final bool isLoading;
  final bool isError;
  String errMsg;

  GetStoresState({this.isLoading, this.isError, this.errMsg})
      : super([isLoading, isError, errMsg]);

  factory GetStoresState.empty() {
    return GetStoresState(
      isLoading: false,
      isError: false,
    );
  }

  factory GetStoresState.isLoading() {
    return GetStoresState(
      isLoading: true,
      isError: false,
    );
  }

  factory GetStoresState.isError({String errMsg}) {
    return GetStoresState(isLoading: false, isError: true, errMsg: errMsg);
  }
}