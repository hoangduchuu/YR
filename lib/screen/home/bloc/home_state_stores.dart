import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Store.dart';

import 'home_state.dart';

class GetMembershipCardSuccessState extends HomeState {
  final List<MembershipCard> memberships;

  GetMembershipCardSuccessState({this.memberships}) : super([memberships]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}

class GetMemberShipCardsEmptyState extends HomeState{

  @override
  String toString() {
    return 'GetMemberShipCardsEmptyState{}';
  }
}
