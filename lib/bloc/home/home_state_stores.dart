import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Store.dart';

import 'home_state.dart';

class GetMembershipCardSuccessState extends HomeState {
  List<MembershipCard> memberships;

  GetMembershipCardSuccessState({this.memberships}) : super([memberships]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}

class GetMemberShipCards extends HomeState {
  final bool isLoading;
  final bool isError;
  String errMsg;
  bool isEmpty = false;

  GetMemberShipCards({this.isLoading, this.isError, this.errMsg, this.isEmpty})
      : super([isLoading, isError, errMsg]);

  factory GetMemberShipCards.empty() {
    return GetMemberShipCards(isLoading: false, isError: false, isEmpty: true);
  }

  factory GetMemberShipCards.isLoading() {
    return GetMemberShipCards(isLoading: true, isError: false, isEmpty: false);
  }

  factory GetMemberShipCards.isError({String errMsg}) {
    return GetMemberShipCards(
        isLoading: false, isError: true, errMsg: errMsg, isEmpty: false);
  }
}
