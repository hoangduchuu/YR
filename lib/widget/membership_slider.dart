import 'package:flutter/material.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/screen/membership/membership_screen.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';

class MemberShipSlider extends StatelessWidget {
  const MemberShipSlider({
    Key key,
    @required this.context,
    @required List<MembershipCard> memberships,
  })  : _memberships = memberships,
        super(key: key);

  final BuildContext context;
  final List<MembershipCard> _memberships;

  @override
  Widget build(BuildContext context) {
    return RestaurantCard(
      cb: (int index) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MemberShipScreen(
                      memberCard: _memberships[index],
                    )));
      },
      memberships: _memberships,
    );
  }
}
