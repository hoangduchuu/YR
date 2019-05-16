import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class RestaurantCard extends StatefulWidget{
  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}
class _RestaurantCardState extends State<RestaurantCard>{

  final List<String> imgList = [
    'https://mcdn.wallpapersafari.com/medium/81/9/ZzUw9E.jpeg',
    'https://wallpapercave.com/wp/O5eAHDa.jpg',
    'https://wallpapercave.com/wp/wp2253880.gif',
    'https://images2.alphacoders.com/466/466692.jpg',
    'http://wallpapersdsc.net/wp-content/uploads/2016/09/KFC-Wallpaper.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CarouselSlider(
      viewportFraction: 0.90,
      aspectRatio: 2.0,
      autoPlay: false,
      enlargeCenterPage: true,
      items: imgList.map(
            (url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                  EdgeInsets.only(top: 10, left: 2, right: 2,bottom: 10),
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      child: GestureDetector(
                          child: Image.network(url,
                              fit: BoxFit.cover),
                          onTap: () {
                            print(imgList.indexOf(url));
                          })));
            },
          );
        },
      ).toList(),
      height: 250,
    );
  }
}