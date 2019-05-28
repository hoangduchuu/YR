import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/bar_code.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/member_card.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';
import 'package:your_reward_user/widget/restaurant_item.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';
import 'package:your_reward_user/widget/voucher.dart';

class CardStoreDetailScreen extends StatefulWidget {
  @override
  _CardStoreDetailScreenState createState() => _CardStoreDetailScreenState();
}

class _CardStoreDetailScreenState extends State<CardStoreDetailScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          MemberCard(
              memberName: 'Phan Nguyễn Song Toàn',
              memberPoint: 2048,
              startDate: '25/01/2018',
              times: 10),
          SizedBox(
            height: 10,
          ),
          BarCode(),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10,right: 20),
            child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12,width: 1)
                  ),
                ),
              child: Text(
                'Cửa hàng',
                style: TextStyle(
                    color: HColors.ColorSecondPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,fontFamily: Hfonts.PrimaryFontBold),
              ),
            )
          ),
          Container(
              height: 160,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  RestaurantItem(
                    storeName: 'Cây sung quán Nam Quốc Cang',
                    storeImage:
                        'http://cdn01.diadiemanuong.com/ddau/640x/undefined-quan-cay-sung-oc-hai-san-nam-quoc-cang-0-8a2a02bd636501452796637913.jpg',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RestaurantItem(
                    storeName: 'Cây sung quán Phạm Thái Bường',
                    storeImage:
                        'http://cdn01.diadiemanuong.com/ddau/640x/undefined-cay-sung-quan-pham-thai-buong-0-8dc2771636531019586948638.jpg',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RestaurantItem(
                    storeName: 'Cây Sung Quán Thảo Điền',
                    storeImage:
                        'http://namanhcatering.com/uploads/tiny_uploads/cay%20sung%20quan/cay%20sung6.jpg',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 10,right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12,width: 1)
                  ),
                ),
                child: Text(
                  'Voucher',
                  style: TextStyle(
                      color: HColors.ColorSecondPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,fontFamily: Hfonts.PrimaryFontBold),
                ),
              )
          ),
          Container(
              height: 215,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Voucher(name: 'Mua 1 tặng 1', imageUrl: 'https://images.foody.vn/res/g17/165353/prof/s576x330/foody-mobile-dsvdvs-jpg.jpg', date: '25/05/2019',),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Free nước', imageUrl: 'https://images.foody.vn/video/s800x450/foody-1-636416969335382272.jpg', date: '25/05/2019',),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Mua 1 tặng 1', imageUrl: 'https://media.foody.vn/res/g72/718125/s512x320/foody-albumfoody-albumimg_4102-.jpg', date: '25/05/2019',),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Giảm 25% cho đơn hàng từ 1000000đ', imageUrl: 'https://placevietnam.com/img/full/binh_luan/1/cay-sung-quan-hai-san-tuoi-song-pham-thai-buong-1531807719-13553.jpg', date: '25/05/2019',discountpercent: 25,),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Mua 1 tặng 1', imageUrl: 'http://uudaicanhan.vpbank.com.vn/sites/default/files/u55/c_0.jpg', date: '25/05/2019',),
                ],
              )),
        ],
      ),
    );
  }
}
