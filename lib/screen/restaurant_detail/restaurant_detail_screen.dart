import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/test/map_screen.dart';
import 'package:your_reward_user/utils/logger.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v1/common_button.dart';

class RestaurantDetailScreen extends StatefulWidget {
  Store _store;

  RestaurantDetailScreen({Store store}) {
    this._store = store;
  }

  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> with SingleTickerProviderStateMixin {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
          onPressed: () {
            Navigator.pop(context);
          }, color: Colors.black,),
        title: Text(
          'CỬA HÀNG',
          style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
        ),
      ),
      body: _buildBody()
    );
  }

  _buildBody() {
    return Container(
      color: HColors.bgColor,
      child: ListView(
        children: <Widget>[
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            child: Stack(
              children: <Widget>[
                _buildSlider(),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      color: HColors.blackAlpha,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget._store.name,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6,),
                          Text(
                            widget._store.description.isEmpty ? 'Chưa xác định' : widget._store.description,
                            style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width: 20,),
              Expanded(
                flex: 1,
                child: CommonButton(
                  backgroundColor: HColors.ColorPrimary,
                  text: 'ĐỊA ĐIỂM',
                  textColor: HColors.black,
                  buttonPadding: 14,
                  icon: ImageIcon(AssetImage('assets/images/ic_location.png')),
                  radiusValue: 4,
                  onPressed: (){
                    _onLocationClick();
                  },
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                flex: 1,
                child: CommonButton(
                  backgroundColor: HColors.red,
                  text: 'LIÊN HỆ',
                  textColor: HColors.white,
                  buttonPadding: 14,
                  icon: ImageIcon(AssetImage('assets/images/ic_phone.png')),
                  radiusValue: 4,
                  onPressed: (){
                    _onContactClick(widget._store.phone);
                  },
                ),
              ),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 16,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
            child: Text(
              'MÔ TẢ',
              style: TextStyle(fontSize: 18, fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text(
                widget._store.description.isEmpty ? 'Chưa có nội dung' : 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(fontFamily: 'Lato'),
              )),
        ],
      ),
    );
  }

  // FIXME: make up no image UI
  Widget _buildSlider() {
    if (imgList == null || imgList.isEmpty) {
      return Container(
        color: Colors.lightBlueAccent,
        height: 200,
        child: Center(
            child: Text(
          "No image avalable",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
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
    LatLng location = LatLng(double.parse(widget._store.addressLat), double.tryParse(widget._store.addressLng));
    log('${widget._store.addressLat} - ${widget._store.addressLng}');
    Store store = widget._store;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GoogleMapScreen(
                  store: store,
                )));
  }
}
