import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_reward_user/model/Store.dart';

class RestaurantCard extends StatefulWidget {
  Function cb;
  List<Store> store;

  RestaurantCard({this.store, this.cb});

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  var currentPosition = 0;
  final List<String> imgList = [
    'http://128.199.78.111:3030/load/image/5cc9ab71760e2d065cdd84ce',
    'https://wallpapercave.com/wp/O5eAHDa.jpg',
    'https://wallpapercave.com/wp/wp2253880.gif',
    'https://images2.alphacoders.com/466/466692.jpg',
    'http://wallpapersdsc.net/wp-content/uploads/2016/09/KFC-Wallpaper.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
    var urls = getStringFromStore(super.widget.store);
    return urls.map(
      (url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10, left: 2, right: 2, bottom: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: GestureDetector(
                        child: Image.network(url, fit: BoxFit.cover),
                        onTap: () {
                          widget.cb(imgList.indexOf(url));
                        })));
          },
        );
      },
    ).toList();
  }

  List<String> getStringFromStore(List<Store> stores) {
    List<String> urls = List<String>();

    if (stores == null) {
      urls.add(
          "http://128.199.78.111:3030/load/image/5cc9ab71760e2d065cdd84ce");
      return urls;
    }
    stores.forEach((it) {
      urls.add(it.storeLogo);
    });
    return urls;
  }
}
