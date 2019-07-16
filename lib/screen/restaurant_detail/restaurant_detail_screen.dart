import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:your_reward_user/test/map_screen.dart';
import 'package:your_reward_user/widget/NetWorkImage.dart';
class RestaurantDetailScreen extends StatefulWidget {
  Store _store;

  RestaurantDetailScreen({Store store}) {
    this._store = store;
  }

  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;
  String url;
  List<String> imgList = new List<String>();
  var selectedMenuItem = '';
  var selectedItem = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController(initialScrollOffset: 0.0);
    imgList = widget._store.images;
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
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildBody(),
        new Positioned(
          //Place it at the top, and not use the entire screen
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: HColors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    ));
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 10),
          height: 200,
          child: _buildSlider(),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: HColors.white,
            border:
                Border(bottom: BorderSide(color: HColors.paleGrey, width: 2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      right: BorderSide(color: HColors.paleGrey, width: 2)),
                ),
                child: InkWell(
                  onTap: ()=>_onContactClick(widget._store.phone),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: HColors.ColorSecondPrimary,
                      ),
                      Text(
                        'Liên hệ',
                        style: TextStyle(
                            color: HColors.ColorSecondPrimary,
                            fontFamily: Hfonts.PrimaryFontBold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      left: BorderSide(color: HColors.paleGrey, width: 2)),
                ),
                child: InkWell(
                  onTap: ()=> _onLocationClick(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: HColors.ColorSecondPrimary,
                      ),
                      Text(
                        'Địa điểm',
                        style: TextStyle(
                            color: HColors.ColorSecondPrimary,
                            fontFamily: Hfonts.PrimaryFontBold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(color: HColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  widget._store.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: HColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: Hfonts.PrimaryFontBold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  widget._store.address,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: HColors.black,
                      fontSize: 13,
                      fontFamily: Hfonts.PrimaryFontRegular,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(color: HColors.ColorSecondPrimary),
          padding: EdgeInsets.only(left: 18, bottom: 5),
          child: Text(
            'Miêu tả',
            style: TextStyle(
                fontSize: 20,
                color: HColors.white,
                fontFamily: Hfonts.PrimaryFontBold),
          ),
        ),
        Container(
            height: 300,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                widget._store.description,
                style: TextStyle(
                    fontFamily: Hfonts.PrimaryFontRegular,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }

  // FIXME: make up no image UI
  Widget _buildSlider() {
    if (imgList == null || imgList.isEmpty) {
      return Container(
        color: Colors.lightBlueAccent,
        height: 200,
        child: Center(child: Text("No image avalable", style: TextStyle(fontSize: 20,color: Colors.white),)),
      );
    }
    return Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return new ImageLoader(
            url: imgList[index],
          );
        },
        itemCount: imgList.length,
        pagination: new SwiperPagination(builder: SwiperPagination.dots));
  }

  _onContactClick(String phone) {
    print("call to $phone");
    UrlLauncher.launch("tel://$phone");
  }
  _onLocationClick() {
    print('${widget._store.addressLng} -- ${widget._store.addressLat}');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMapScreen()));
  }

}
