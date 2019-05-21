import 'package:flutter/material.dart';

import 'app.dart';


void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(),
//    );
//  }
//}
//
////<<<<<<< HEAD
////class MyHomePage extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(body: ListView(
////      children: <Widget>[
////        BarCode(imageLink: '',),
////        RowInfo(title: 'title',info: 'info'),
////        RestaurantInfo(
////          logoLink: 'assets/images/logo.png',
////          name: 'Cây Sung Quán',
////          address: '8 Nam Quốc Cang, Phường Phạm Ngũ Lão, Quận 1'),
////        Row(children: <Widget>[
////          RoundIcon(image: 'assets/images/ic_share.png', callback: (){
////            print('abc');
////          }),
////          RoundIcon(image: 'assets/images/ic_map.png', callback: (){
////            print('abc');
////          }),
////        ],)
////      ],
////    ));
////=======
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        resizeToAvoidBottomPadding: true,
//        appBar: AppBar(
//          title: Text(widget.title),
//        ),
//        body: ListView(
//          children: <Widget>[
//            CommonButton(
//              onPressed: () {
//                print('Facebook Login');
//              },
//              buttonPadding: 11,
//              backgroundColor: HColors.ColorBgFacebook,
//              textColor: HColors.textOnButtonColor,
//              text: Text(
//                'Đăng nhập với facebook',
//                style: TextStyle(fontSize: 15),
//              ),
//              icon: Icon(
//                FontAwesomeIcons.facebookSquare,
//                size: 20,
//              ),
//              radiusValue: 30,
//              //width: 300,
//            ),
//            CommonButton(
//              onPressed: () {
//                print('Google Login');
//              },
//              buttonPadding: 11,
//              backgroundColor: HColors.ColorBgGoogle,
//              textColor: HColors.textOnButtonColor,
//              text: Text(
//                'Đăng nhập với google',
//                style: TextStyle(fontSize: 15),
//              ),
//              icon: Icon(
//                FontAwesomeIcons.google,
//                size: 20,
//              ),
//              radiusValue: 30,
//              //width: 300,
//            ),
//            CommonButton(
//              onPressed: () {
//                print('Commom Login');
//              },
//              buttonPadding: 15,
//              backgroundColor: HColors.ColorPrimary,
//              textColor: HColors.textOnButtonColor,
//              text: Text(
//                'Đăng nhập',
//                style: TextStyle(fontSize: 15),
//              ),
//              //icon: Icon(FontAwesomeIcons.facebookSquare,size: 20,),
//              radiusValue: 30,
//              //width: 300,
//            ),
//            CommonButton(
//              onPressed: () {
//                print('Save');
//              },
//              buttonPadding: 13,
//              backgroundColor: HColors.saveButtonColor,
//              textColor: HColors.textOnButtonColor,
//              text: Text(
//                'Lưu lại',
//                style: TextStyle(fontSize: 15),
//              ),
//              //icon: Icon(FontAwesomeIcons.facebookSquare,size: 20,),
//              radiusValue: 7,
//              //width: 300,
//            ),
//            YRTextField(
//              icon: FontAwesomeIcons.envelopeOpen,
//              onTextChanged: (value) {},
//              titleText: 'Tên',
//              hintText: 'Nhập họ tên',
//            ),
//            RestaurantCard(),
//            MemberCard(
//              memberName: 'Phan Nguyễn Song Toàn',
//              memberPoint: 2048,
//              times: 10,
//              startDate: '01/01/2019',
//            ),
//            MemberCard(
//              memberName: 'Phan Nguyễn Song Toàn',
//              memberPoint: 2048,
//              times: 10,
//              startDate: '01/01/2019',
//              isVIP: true,
//            ),
//            Padding(padding: EdgeInsets.all(10),
//            child: ListView(
//              shrinkWrap: true,
//              children: <Widget>[
//                TranferHistoryRow(
//                  tranferName: 'Giao dịch số 1',
//                  time: '17:00',
//                  date: '15/5/2019',
//                  place: 'Popeyes',
//                  price: '10000000đ',
//                  ispayByCard: true,
//                ),
//                TranferHistoryRow(
//                  tranferName: 'Giao dịch số 2',
//                  time: '18:00',
//                  date: '15/5/2019',
//                  place: 'KFC',
//                  price: '10000000đ',
//                  ispayByCard: false,
//                )
//              ],
//            ),),
//          ],
//        ),
//        bottomNavigationBar: BottomNavigationBar(
//          currentIndex: 0,
//          type: BottomNavigationBarType.fixed,
//          items: [
//            BottomNavigationBarItem(
//                icon: Icon(FontAwesomeIcons.home, color: HColors.saveButtonColor),
//                title: SizedBox.shrink()),
//            BottomNavigationBarItem(
//                icon: Icon(FontAwesomeIcons.bell, color: HColors.saveButtonColor),
//                title: SizedBox
//                    .shrink() //new Text('Thông báo',style: TextStyle(color: saveButtonColor,fontSize: 10))
//                ),
//          ],
//          onTap: (index) {},
//        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        floatingActionButton: new Container(
//          margin: new EdgeInsets.all(10.0),
//          decoration: new BoxDecoration(),
//          child: FloatingActionButton(
//            onPressed: () {},
//            child: new Icon(FontAwesomeIcons.wallet),
//            backgroundColor: HColors.saveButtonColor,
//          ),
//        )); // is trailing comma makes auto-formatting nicer for build methods.
//  }
//}

