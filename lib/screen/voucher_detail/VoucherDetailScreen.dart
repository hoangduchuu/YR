import 'package:flutter/material.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/widget/v1/hooray_barcode.dart';

class VoucherDetailScreen extends StatelessWidget {
  Coupon coupon;

  VoucherDetailScreen(this.coupon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HColors.white,
        brightness: Brightness.light,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HColors.ColorSecondPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.0,
      ),
      backgroundColor: HColors.bgColor,
      body: ListView(
        children: <Widget>[
          HoorayBarCode(content: coupon.code),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Text(
              coupon.title,
              style: TextStyle(fontSize: 20, color: Colors.red, fontFamily: 'Aptima', fontStyle:  FontStyle.normal),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Text(
              'Ngày hết hạn:  ${coupon.endDate}',
              style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'Aptima', fontStyle: FontStyle.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Nội dung:  ${coupon.getDescription()}',
              style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'Aptima', fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
