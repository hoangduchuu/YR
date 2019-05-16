import 'package:your_reward_user/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/widget/member_card.dart';
import 'package:your_reward_user/widget/restaurant_card.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'package:your_reward_user/widget/tranfer_history_row.dart';
import 'styles/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            CommonButton(
              onPressed: () {
                print('Facebook Login');
              },
              buttonPadding: 11,
              backgroundColor: ColorBgFacebook,
              textColor: textOnButtonColor,
              text: Text(
                'Đăng nhập với facebook',
                style: TextStyle(fontSize: 15),
              ),
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
              backgroundColor: ColorBgGoogle,
              textColor: textOnButtonColor,
              text: Text(
                'Đăng nhập với google',
                style: TextStyle(fontSize: 15),
              ),
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
              backgroundColor: ColorPrimary,
              textColor: textOnButtonColor,
              text: Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 15),
              ),
              //icon: Icon(FontAwesomeIcons.facebookSquare,size: 20,),
              radiusValue: 30,
              //width: 300,
            ),
            CommonButton(
              onPressed: () {
                print('Save');
              },
              buttonPadding: 13,
              backgroundColor: saveButtonColor,
              textColor: textOnButtonColor,
              text: Text(
                'Lưu lại',
                style: TextStyle(fontSize: 15),
              ),
              //icon: Icon(FontAwesomeIcons.facebookSquare,size: 20,),
              radiusValue: 7,
              //width: 300,
            ),
            YRTextField(
              icon: FontAwesomeIcons.envelopeOpen,
              onTextChanged: (value) {},
              titleText: 'Tên',
              hintText: 'Nhập họ tên',
            ),
            RestaurantCard(),
            MemberCard(
              memberName: 'Phan Nguyễn Song Toàn',
              memberPoint: 2048,
              times: 10,
              startDate: '01/01/2019',
            ),
            Padding(padding: EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                TranferHistoryRow(
                  tranferName: 'Giao dịch số 1',
                  time: '17:00',
                  date: '15/5/2019',
                  place: 'Popeyes',
                  price: '1000000000đ',
                  ispayByCard: true,
                ),
                TranferHistoryRow(
                  tranferName: 'Giao dịch số 2',
                  time: '18:00',
                  date: '15/5/2019',
                  place: 'KFC',
                  price: '1000000000đ',
                  ispayByCard: false,
                )
              ],
            ),)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home, color: saveButtonColor),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bell, color: saveButtonColor),
                title: SizedBox
                    .shrink() //new Text('Thông báo',style: TextStyle(color: saveButtonColor,fontSize: 10))
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
            backgroundColor: saveButtonColor,
          ),
        )); // is trailing comma makes auto-formatting nicer for build methods.
  }
}
