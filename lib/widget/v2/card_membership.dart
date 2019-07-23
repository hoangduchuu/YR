import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';

class CardMemberShip extends StatelessWidget {
  String logo;
  String level;
  String joinDate;
  String point;

  CardMemberShip({this.logo, this.level, this.joinDate, this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg_member_card.png"), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: ImageLoader(
                  circleImage: true,
                  radius: 50,
                  url: this.logo,
                ),
              ),
            Text(this.level, style: TextStyle(fontWeight: FontWeight.bold,color: HColors.white),),
          ],),
          SizedBox(height: 56,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(this.point, style: TextStyle(fontSize: 16,color: HColors.white, fontWeight: FontWeight.bold),),
                  Text('Lần tích điểm', style: TextStyle(fontWeight: FontWeight.w100, color: HColors.white),),
                ],
              ),
              SizedBox(width: 16,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(this.joinDate, style: TextStyle(fontSize: 16,color: HColors.white ,fontWeight: FontWeight.bold),),
                  Text('Ngày Tham Gia', style: TextStyle(fontWeight: FontWeight.w100,color: HColors.white),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
