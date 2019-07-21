import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/member_card.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text("Widget Test"),
        ),
        body: ListView(
          children: <Widget>[
            CommonButton(
              onPressed: () {
                print('Facebook Login');
              },
              buttonPadding: 11,
              backgroundColor: HColors.ColorBgFacebook,
              textColor: HColors.textOnButtonColor,
              text: "Đăng nhập với facebook",
              icon: Icon(
                FontAwesomeIcons.facebookSquare,
                size: 20,
              ),
              radiusValue: 30,
              //width: 300,
            ),
            CommonButton(
              onPressed: () {
                print('Google Login');
              },
              buttonPadding: 11,
              backgroundColor: HColors.ColorBgGoogle,
              textColor: HColors.textOnButtonColor,
              text: "Đăng nhập với google",
              icon: Icon(
                FontAwesomeIcons.google,
                size: 20,
              ),
              radiusValue: 30,
              //width: 300,
            ),
            CommonButton(
              onPressed: () {
                print('Commom Login');
              },
              buttonPadding: 15,
              backgroundColor: HColors.ColorPrimary,
              textColor: HColors.textOnButtonColor,
              text: "Đăng nhập",
              //icon: Icon(FontAwesomeIcons.facebookSquare,size: 20,),
              radiusValue: 30,
              //width: 300,
            ),
            CommonButton(
              onPressed: () {
                print('Save');
              },
              buttonPadding: 13,
              backgroundColor: HColors.saveButtonColor,
              textColor: HColors.textOnButtonColor,
              text: "'Lưu lại'",
              //icon: Icon(FontAwesomeIcons.facebookSquare,size: 20,),
              radiusValue: 7,
              //width: 300,
            ),
            YRTextField(
              onTextChanged: (value) {},
              hintText: 'Nhập họ tên',
            ),
            RestaurantCard(cb: (index) {}),
            MemberCard(
              memberName: 'Phan Nguyễn Song Toàn',
              memberPoint: 2048,
              times: 10,
              startDate: '01/01/2019',
            ),
            MemberCard(
              memberName: 'Phan Nguyễn Song Toàn',
              memberPoint: 2048,
              times: 10,
              startDate: '01/01/2019',
              isVIP: true,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TranferHistoryRow(
                    tranferName: 'Giao dịch số 1',
                    time: '17:00',
                    date: '15/5/2019',
                    place: 'Popeyes',
                    price: '10000000đ',
                    point: 0,
                    storeType: '',
                  ),
                  TranferHistoryRow(
                    tranferName: 'Giao dịch số 2',
                    time: '18:00',
                    date: '15/5/2019',
                    place: 'KFC',
                    price: '10000000đ',
                    point: 0,
                    storeType: '',
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home, color: HColors.saveButtonColor), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bell, color: HColors.saveButtonColor),
                title: SizedBox.shrink() //new Text('Thông báo',style: TextStyle(color: saveButtonColor,fontSize: 10))
                ),
          ],
          onTap: (index) {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new Container(
          margin: new EdgeInsets.all(10.0),
          decoration: new BoxDecoration(),
          child: FloatingActionButton(
            onPressed: () {},
            child: new Icon(FontAwesomeIcons.wallet),
            backgroundColor: HColors.saveButtonColor,
          ),
        )); // is trailing comma makes auto-formatting nicer for build methods.
  }
}
