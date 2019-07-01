import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/widget/bar_code.dart';

class VoucherDetailScreen extends StatelessWidget {
  Coupon coupon;

  VoucherDetailScreen(this.coupon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HColors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HColors.ColorSecondPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.userCircle,
                color: HColors.ColorSecondPrimary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/accountinfo');
              }),
        ],
        elevation: 0.0,
      ),

      // FIXME : makeup lại
      body: ListView(
        children: <Widget>[
          BarCode(value: coupon.code),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Text(
              coupon.title,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Text(
              'Ngày hết hạn:  ${coupon.endDate}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Nội dung:  ${coupon.getDescription()}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
