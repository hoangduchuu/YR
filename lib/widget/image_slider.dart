import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imgList = [
    'https://media3.scdn.vn/img3/2019/5_10/88UnY9.jpg',
    'https://media3.scdn.vn/img3/2019/5_4/lRYvUA.jpg',
    'https://media3.scdn.vn/img3/2019/5_9/IbOfDX.png',
    'https://cf.shopee.vn/file/ba27e700de4d865c27d68c8faf1258e8',
    'https://cf.shopee.vn/file/86d063780b2169e50306a312ff15b9dd',
    'https://cf.shopee.vn/file/0eba3e5596cd7899df503dcb43d5eb57',
    'https://cf.shopee.vn/file/9e5372311cebd87f2fec8fe05163fe23',
    'https://cf.shopee.vn/file/fb3d3105ea39a6cd3b068b5b77fdc93d'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Swiper(
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.network(
                          imgList[index],
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: imgList.length,
                      pagination:
                      new SwiperPagination(builder: SwiperPagination.dots));


        }
}