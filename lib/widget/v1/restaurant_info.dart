import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/styles.dart';

class RestaurantInfo extends StatelessWidget {
  String logoLink;
  String name;
  String address;

  RestaurantInfo({@required this.logoLink, @required this.name, @required this.address})
      : assert(logoLink != null),
        assert(name != null),
        assert(address != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          Opacity(
              opacity: 0.08,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/restaurant_bg.jpg', fit: BoxFit.fitWidth))),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(width: 64, height: 64, child: Image.asset('assets/images/logo.png')),
                SizedBox(
                  height: spacing_6,
                ),
                Text(
                  this.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: spacing_6,
                ),
                Text(
                  this.address,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
