import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_reward_user/entity/enums.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 100,
                height: 100,
                child: ImageLoader(
                  circleImage: true,
                  radius: 50,
                  url: item.logo,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
            alignment: Alignment.bottomRight,
            child: Text(
              "${item.levelName}".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      );
}
