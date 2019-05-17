

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/test/account_information_screen.dart';
import 'package:your_reward_user/test/bottom_navigation.dart';
import 'package:your_reward_user/test/card_store_detail_screen.dart';
import 'package:your_reward_user/test/error_screen.dart';
import 'package:your_reward_user/test/forgotpass_screen.dart';
import 'package:your_reward_user/test/home_screen.dart';
import 'package:your_reward_user/test/login_screen.dart';
import 'package:your_reward_user/test/main_screen.dart';
import 'package:your_reward_user/test/restaurant_detail_screen.dart';
import 'package:your_reward_user/test/signup_screen.dart';

import 'test/widget_screen.dart';

//class này sẽ cấu hình route tới các screen của màn hình
class MyApp extends StatelessWidget {

  final app = new MaterialApp(
    routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MainScreen(),
        '/bottombar':(BuildContext context)=>BottomNavigation(),
        '/test': (BuildContext context) => TestScreen(),
        '/login':(BuildContext context)=> LoginScreen(),
        '/signup':(BuildContext context)=>SignUpScreen(),
        '/forgotpass':(BuildContext context)=>ForgotPassScreen(),
        '/home':(BuildContext context)=>HomeScreen(),
        '/carddetail':(BuildContext context)=>CardStoreDetailScreen(),
        '/restaurantdetail':(BuildContext context)=>RestaurantDetailScreen(),
        '/errorscreen':(BuildContext context)=>ErrorScreen(),
        '/accountinfo':(BuildContext context)=>AccountInformationScreen(),
    },
    initialRoute: '/',
    //unknown route
  );

  @override
  Widget build(BuildContext context) {
    return app;
  }
}
