import 'package:flutter/material.dart';
import 'package:your_reward_user/widget/restaurant_info.dart';
import 'package:your_reward_user/widget/round_icon.dart';

import 'widget/bar_code.dart';
import 'widget/row_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
      children: <Widget>[
        BarCode(imageLink: '',),
        RowInfo(title: 'title',info: 'info'),
        RestaurantInfo(
          logoLink: 'assets/images/logo.png',
          name: 'Cây Sung Quán',
          address: '8 Nam Quốc Cang, Phường Phạm Ngũ Lão, Quận 1'),
        Row(children: <Widget>[
          RoundIcon(image: 'assets/images/ic_share.png', callback: (){
            print('abc');
          }),
          RoundIcon(image: 'assets/images/ic_map.png', callback: (){
            print('abc');
          }),
        ],)
      ],
    ));
  }
}

