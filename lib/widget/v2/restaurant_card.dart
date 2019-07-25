import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_reward_user/entity/enums.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';
import 'package:your_reward_user/widget/v1/no_membership_cart.dart';

class RestaurantCard extends StatefulWidget {
  Function cb;
  List<MembershipCard> memberships;

  RestaurantCard({this.memberships, this.cb});

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  var currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    if (super.widget.memberships == null || super.widget.memberships.isEmpty) {
      return new NoMemberShipCard("Chưa có hình ảnh");
    }
    return CarouselSlider(
      enableInfiniteScroll: false,
      // disable loop
      initialPage: 2,
      viewportFraction: 0.90,
      aspectRatio: 2.0,
      autoPlay: false,
      enlargeCenterPage: true,
      items: buildList(),
      onPageChanged: (index) {
        currentPosition = index;
      },
      height: 230,
    );
  }

  List<Builder> buildList() {
    var store = super.widget.memberships;
    return store.map(
      (item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10, left: 2, right: 2, bottom: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: GestureDetector(
                        child: _buildStack(item),
                        onTap: () {
                          widget.cb(widget.memberships.indexOf(item));
                        })));
          },
        );
      },
    ).toList();
  }

  Widget _buildStack(MembershipCard item) => Stack(
        fit: StackFit.expand,
        alignment: const Alignment(0, 0),
        children: [
          ImageLoader(
            url: item.img,
            boxFit: BoxFit.fill,
            overlay: true,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ImageLoader(
                        circleImage: true,
                        radius: 50,
                        url: item.logo,
                      ),
                    ),
                    Text(item.levelName.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: HColors.white, fontSize: 22),),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('${item.points}', style: TextStyle(fontSize: 16,color: HColors.white, fontWeight: FontWeight.bold),),
                        Text('Lần tích điểm', style: TextStyle(fontWeight: FontWeight.w100, color: HColors.white),),
                      ],
                    ),
                    SizedBox(width: 16,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(CommonUtils.getDateFormat(item.createdAt.toString()), style: TextStyle(fontSize: 16,color: HColors.white ,fontWeight: FontWeight.bold),),
                        Text('Ngày Tham Gia', style: TextStyle(fontWeight: FontWeight.w100,color: HColors.white),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
  );

//  Widget _buildCard(){
//    return Container(
//      margin: EdgeInsets.all(16),
//      padding: EdgeInsets.all(12),
//      decoration: BoxDecoration(
//          image: DecorationImage(image: AssetImage("assets/images/bg_member_card.png"), fit: BoxFit.fill),
//          borderRadius: BorderRadius.all(Radius.circular(12))
//      ),
//      child: Column(
//        children: <Widget>[
//          SizedBox(height: 8,),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              SizedBox(
//                width: 100,
//                height: 100,
//                child: ImageLoader(
//                  circleImage: true,
//                  radius: 50,
//                  url: this.logo,
//                ),
//              ),
//              Text(this.level.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: HColors.white, fontSize: 22),),
//            ],),
//          SizedBox(height: 56,),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(this.point, style: TextStyle(fontSize: 16,color: HColors.white, fontWeight: FontWeight.bold),),
//                  Text('Lần tích điểm', style: TextStyle(fontWeight: FontWeight.w100, color: HColors.white),),
//                ],
//              ),
//              SizedBox(width: 16,),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(this.joinDate, style: TextStyle(fontSize: 16,color: HColors.white ,fontWeight: FontWeight.bold),),
//                  Text('Ngày Tham Gia', style: TextStyle(fontWeight: FontWeight.w100,color: HColors.white),),
//                ],
//              ),
//            ],
//          )
//        ],
//      ),
//    );
//  }

}
