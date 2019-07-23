import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/model/MembershipCard.dart';
import 'package:your_reward_user/screen/transaction/transactions_screen.dart';
import 'package:your_reward_user/styles/styles.dart';

import 'detail/v2/card_store_detail_screen.dart';

class MemberShipScreen extends StatefulWidget {
  final MembershipCard memberCard;

  const MemberShipScreen({Key key, @required this.memberCard}) : super(key: key);

  _MemberShipScreenState createState() => _MemberShipScreenState();
}

class _MemberShipScreenState extends State<MemberShipScreen> {
  int _currentIndex = 0;
  List<Widget> _children;

  // FIXME tìm cách không cho load lại data khi chuyển "fragment";
  @override
  void initState() {
    super.initState();
    _children = [
      MemberShipStoreDetailScreen(memberCard: widget.memberCard),
      TransactionScreen(
        ownerId: widget.memberCard.ownerId,
      )
    ];
  }

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
                icon: Icon(FontAwesomeIcons.home,
                    color: _currentIndex == 0 ? HColors.ColorSecondPrimary : HColors.inactiveTabColor),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.solidBell,
                  color: _currentIndex == 1 ? HColors.ColorSecondPrimary : HColors.inactiveTabColor,
                ),
                title: SizedBox.shrink() //new Text('Thông báo',style: TextStyle(color: saveButtonColor,fontSize: 10))
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
              Navigator.pop(context);
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
