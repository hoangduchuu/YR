import 'package:your_reward_user/model/MembershipCard.dart';

import 'home_state.dart';

class GetMembershipCardSuccessState extends HomeState {
  final List<MembershipCard> memberships;

  GetMembershipCardSuccessState({this.memberships}) : super([memberships]);

  @override
  String toString() {
    return 'OnGetStoresSuccess{}';
  }
}

class GetMemberShipCardsEmptyState extends HomeState {
  List<MembershipCard> memberships;
  GetMemberShipCardsEmptyState(this.memberships);

  @override
  String toString() {
    return 'GetMemberShipCardsEmptyState{}';
  }
}
