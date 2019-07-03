import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/model/Store.dart';

import 'no_membership_cart.dart';

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
      height: 200,
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
                    borderRadius: BorderRadius.all(Radius.circular(15)),
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
          Image.network(item.img, fit: BoxFit.fill),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: CircleAvatar(
                radius: 18,
                child: ClipOval(
                  child: Image.network(
                    item.logo,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
            alignment: Alignment.bottomLeft,
            child: Text(
              item.ownerName, // FIXME  use from api =>  item.ownerName;
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      );
}
