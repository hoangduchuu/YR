import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/test/card_store_detail_screen.dart';
import 'package:your_reward_user/test/home_screen.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/member_card.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';

class BottomNavigation extends StatefulWidget {
  _BottomNavigationState createState()=> _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    CardStoreDetailScreen(),
    CardStoreDetailScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.home, color: _currentIndex==0?HColors.ColorSecondPrimary:HColors.inactiveTabColor),
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidBell, color: _currentIndex==1?HColors.ColorSecondPrimary:HColors.inactiveTabColor,),
                  title: SizedBox
                      .shrink() //new Text('Thông báo',style: TextStyle(color: saveButtonColor,fontSize: 10))
              ),
            ],
            onTap: onTabTapped,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new Container(
          margin: new EdgeInsets.all(10.0),
          decoration: new BoxDecoration(),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: new Icon(FontAwesomeIcons.wallet),
            backgroundColor: HColors.ColorSecondPrimary,
          ),
        )); // is trailing comma makes auto-formatting nicer for build methods.
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
