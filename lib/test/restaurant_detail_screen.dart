import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
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
    'http://namanhcatering.com/uploads/tiny_uploads/cay%20sung%20quan/cay%20sung13.jpg',
    'http://cdn01.diadiemanuong.com/ddau/640x/undefined-quan-cay-sung-oc-hai-san-nam-quoc-cang-0-7d6bae89636506262848545869.jpg',
    'https://images.foody.vn/res/g72/718125/s800/foody-cay-sung-quan-hai-san-tuoi-song-pham-thai-buong-477-636530863945871844.jpg',
    'http://cdn01.diadiemanuong.com/ddau/640x/undefined-cay-sung-quan-pham-thai-buong-0-8dc2771636531019586948638.jpg',
    'http://namanhcatering.com/uploads/tiny_uploads/cay%20sung%20quan/cay%20sung6.jpg',
  ];
  var selectedMenuItem = '';
  var selectedItem = '';

  @override
  void initState() {
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
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildBody(),
          new Positioned( //Place it at the top, and not use the entire screen
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                color: HColors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),),
        ],
      )

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
//        RestaurantInfo(logoLink: '', name: 'Cay Sung',address: 'Nam Quoc Cang'),
//        SizedBox(height: 15,),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RoundIcon(image: 'assets/images/ic_map.png', callback: (){
//
//            }),
//            SizedBox(width: 15,),
//            RoundIcon(image: 'assets/images/ic_map.png', callback: (){
//
//            }),
//            SizedBox(width: 15,),
//            RoundIcon(image: 'assets/images/ic_share.png', callback: (){
//
//            }),
//            SizedBox(width: 15,),
//            RoundIcon(image: 'assets/images/ic_share.png', callback: (){
//
//            }),
//          ],
//        ),
//        Column(
//          children: <Widget>[
//            RowInfo(title: 'Điện thoại', info: '123456789'),
//            RowInfo(title: 'Loại cửa hàng', info: 'Ăn uống'),
//            RowInfo(title: 'Giá trung bình', info: '40000đ-50000đ'),
//          ],
//        )
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 60,
          decoration: BoxDecoration(
            color: HColors.white,
            border: Border(
                bottom: BorderSide(color: HColors.paleGrey, width: 2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      right: BorderSide(color: HColors.paleGrey, width: 2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone, color: HColors.ColorSecondPrimary,),
                    Text(
                      'Liên hệ', style: TextStyle(color: HColors.ColorSecondPrimary,fontFamily: Hfonts.PrimaryFontBold),),
                  ],
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      left: BorderSide(color: HColors.paleGrey, width: 2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, color: HColors.ColorSecondPrimary,),
                    Text('Địa điểm', style: TextStyle(color: HColors.ColorSecondPrimary,fontFamily: Hfonts.PrimaryFontBold),),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(color: HColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                child: Text(
                  'Quán cây sung', overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: HColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,fontFamily: Hfonts.PrimaryFontBold),),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                child: Text(
                  '144 Something', overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(color: HColors.black, fontSize: 13,fontFamily: Hfonts.PrimaryFontRegular,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(color: HColors.ColorSecondPrimary),
          padding: EdgeInsets.only(left: 18, bottom: 5),
          child: Text(
            'Miêu tả', style: TextStyle(fontSize: 20, color: HColors.white,fontFamily: Hfonts.PrimaryFontBold),),
        ),
        Container(
            height: 300,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              child: Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',style: TextStyle(fontFamily: Hfonts.PrimaryFontRegular,fontSize: 15,fontWeight: FontWeight.bold),),
            )),
      ],
    );
  }
}
//    return Scaffold(
//    backgroundColor: HColors.white,
//    body: _buildBody(),
//    appBar: AppBar(
//    backgroundColor: HColors.ColorSecondPrimary,
//    elevation: 0.0,
//    leading: IconButton(icon: Icon(Icons.arrow_back_ios),color: HColors.white, onPressed: (){
//    Navigator.pop(context);
//    },
//    )
//    ,
//    )
//    ,
//    );
//  }
//

