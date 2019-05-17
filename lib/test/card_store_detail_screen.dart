import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Colors.black12,
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
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Cửa hàng',
              style: TextStyle(
                  color: HColors.ColorSecondPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
              height: 160,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  RestaurantItem(
                    storeName: 'KFC',
                    storeImage:
                        'https://tea-3.lozi.vn/v1/images/resized/ga-ran-kfc-sSsnDgUgtZZZ5NEs-69045-1464881189?w=480&type=o',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RestaurantItem(
                    storeName: 'KFC',
                    storeImage:
                        'https://tea-3.lozi.vn/v1/images/resized/ga-ran-kfc-sSsnDgUgtZZZ5NEs-69045-1464881189?w=480&type=o',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RestaurantItem(
                    storeName: 'KFC',
                    storeImage:
                        'https://tea-3.lozi.vn/v1/images/resized/ga-ran-kfc-sSsnDgUgtZZZ5NEs-69045-1464881189?w=480&type=o',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RestaurantItem(
                    storeName: 'KFC',
                    storeImage:
                        'https://tea-3.lozi.vn/v1/images/resized/ga-ran-kfc-sSsnDgUgtZZZ5NEs-69045-1464881189?w=480&type=o',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RestaurantItem(
                    storeName: 'KFC',
                    storeImage:
                        'https://tea-3.lozi.vn/v1/images/resized/ga-ran-kfc-sSsnDgUgtZZZ5NEs-69045-1464881189?w=480&type=o',
                    onClick: (){
                      Navigator.pushNamed(context, '/restaurantdetail');
                    },
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Voucher',
              style: TextStyle(
                  color: HColors.ColorSecondPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
              height: 250,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Voucher(name: 'Mua 1 tặng 1', imageUrl: 'https://tea-1.lozi.vn/v1/images/resized/kfc-1-4242080-1511160620?w=480&type=s', date: '25/05/2019',isPlusOne: true,),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Free nước', imageUrl: 'https://tea-1.lozi.vn/v1/images/resized/kfc-1-4242080-1511160620?w=480&type=s', date: '25/05/2019',isFree: true,),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Mua 1 tặng 1', imageUrl: 'https://tea-1.lozi.vn/v1/images/resized/kfc-1-4242080-1511160620?w=480&type=s', date: '25/05/2019',isPlusOne: true,),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Giảm 25% cho đơn hàng từ 1000000đ', imageUrl: 'https://tea-1.lozi.vn/v1/images/resized/kfc-1-4242080-1511160620?w=480&type=s', date: '25/05/2019',isDiscount: true,discountpercent: 25,),
                  SizedBox(
                    width: 10,
                  ),
                  Voucher(name: 'Mua 1 tặng 1', imageUrl: 'https://tea-1.lozi.vn/v1/images/resized/kfc-1-4242080-1511160620?w=480&type=s', date: '25/05/2019',isPlusOne: true,),
                ],
              )),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
