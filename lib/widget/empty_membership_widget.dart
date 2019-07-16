import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

import 'hooray_barcode.dart';
import 'member_card.dart';

class EmptyCardScreen extends StatelessWidget {
  User user;

  EmptyCardScreen.user(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.userCircle),
            color: HColors.ColorSecondPrimary,
            onPressed: () {
              Navigator.pushNamed(context, '/accountinfo');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          MemberCard(
              memberName: user.fullName, memberPoint: 0, startDate: CommonUtils.getDateFormat(user.createAt), times: 0),
          HoorayBarCode(
            content: user.phone.toString(),
          )
        ],
      ),
    );
  }
}
