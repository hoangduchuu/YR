import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HColors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HColors.ColorSecondPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.userCircle,
                color: HColors.ColorSecondPrimary,
              ),
              onPressed: () {}),
        ],
        elevation: 0.0,
      ),
      backgroundColor: HColors.white,
      body: Column(
        children: <Widget>[
          RestaurantCard(cb: (index){
            print('you clicked $index');
            Navigator.pushNamed(context, '/bottombar');
          }),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              'Lịch sử giao dịch',
              style: TextStyle(
                  color: HColors.ColorSecondPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.375,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                TranferHistoryRow(
                    tranferName: 'Giao dịch số 1',
                    time: '18:00',
                    date: '16/5/2019',
                    place: 'KFC',
                    price: '100000đ',
                    storeIcon: FontAwesomeIcons.ccVisa,
                    ispayByCard: true),
                TranferHistoryRow(
                    tranferName: 'Giao dịch số 2',
                    time: '15:00',
                    date: '16/5/2019',
                    place: 'Pizza Huts',
                    price: '100000đ',
                    storeIcon: FontAwesomeIcons.pizzaSlice,
                    ispayByCard: true),
                TranferHistoryRow(
                    tranferName: 'Giao dịch số 3',
                    time: '17:00',
                    date: '16/5/2019',
                    place: 'KFC',
                    price: '100000đ',
                    storeIcon: FontAwesomeIcons.calculator,
                    ispayByCard: true),
                TranferHistoryRow(
                    tranferName: 'Giao dịch số 4',
                    time: '12:00',
                    date: '16/5/2019',
                    place: 'Lotteria',
                    price: '100000đ',
                    storeIcon: FontAwesomeIcons.ccDinersClub,
                    ispayByCard: true),
              ],
            ),
          )
        ],
      ),
    );
  }
}
