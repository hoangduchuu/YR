import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/restaurant_info.dart';
import 'package:your_reward_user/widget/round_icon.dart';
import 'package:your_reward_user/widget/row_info.dart';

class RestaurantDetailScreen extends StatefulWidget {
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;
  String url;
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
  var selectedMenuItem = '';
  var selectedItem = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HColors.white,
      body: _buildBody(),
      appBar: AppBar(
        backgroundColor: HColors.ColorSecondPrimary,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),color: HColors.white, onPressed: (){
          Navigator.pop(context);
        },
        ),
      ),
    );
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 10),
          height: 200,
          child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  imgList[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: imgList.length,
              pagination: new SwiperPagination(
                  builder: SwiperPagination.dots)),
        ),
        RestaurantInfo(logoLink: '', name: 'Cay Sung',address: 'Nam Quoc Cang'),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIcon(image: 'assets/images/ic_map.png', callback: (){

            }),
            SizedBox(width: 15,),
            RoundIcon(image: 'assets/images/ic_map.png', callback: (){

            }),
            SizedBox(width: 15,),
            RoundIcon(image: 'assets/images/ic_share.png', callback: (){

            }),
            SizedBox(width: 15,),
            RoundIcon(image: 'assets/images/ic_share.png', callback: (){

            }),
          ],
        ),
        Column(
          children: <Widget>[
            RowInfo(title: 'Điện thoại', info: '123456789'),
            RowInfo(title: 'Loại cửa hàng', info: 'Ăn uống'),
            RowInfo(title: 'Giá trung bình', info: '40000đ-50000đ'),
          ],
        )
      ],
    );
  }
}
