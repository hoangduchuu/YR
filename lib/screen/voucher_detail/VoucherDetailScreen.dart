import 'package:flutter/material.dart';
import 'package:your_reward_user/model/Coupon.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/widget/v2/yellow_barcode.dart';

class VoucherDetailScreen extends StatelessWidget {
  Coupon coupon;

  VoucherDetailScreen({this.coupon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HColors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        elevation: 0.0,
        title: Text(
          'VOUCHER CỦA TÔI',
          style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: HColors.bgColor,
      body: ListView(
        children: <Widget>[
          YellowBarcode(
            coupon.code,
            elevation: 0,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  coupon.title,
                  style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Lato', fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Ngày hết hạn:  ${coupon.endDate}',
                  style: TextStyle(fontSize: 12, color: Colors.black54, fontFamily: 'Lato'),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Nội dung:  ${coupon.getDescription()}',
                  style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'Lato'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
