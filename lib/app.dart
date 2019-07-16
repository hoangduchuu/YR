import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/screen/account_info/account_information_screen.dart';
import 'package:your_reward_user/screen/forgotpass/forgotpass_screen.dart';
import 'package:your_reward_user/screen/home/home_screen.dart';
import 'package:your_reward_user/screen/login/login_screen.dart';
import 'package:your_reward_user/screen/membership/detail/card_store_detail_screen.dart';
import 'package:your_reward_user/screen/membership/membership_screen.dart';
import 'package:your_reward_user/screen/restaurant_detail/restaurant_detail_screen.dart';
import 'package:your_reward_user/screen/sign_up/signup_screen.dart';
import 'package:your_reward_user/screen/splash/SplashScreen.dart';
import 'package:your_reward_user/test/api_test_screen.dart';
import 'package:your_reward_user/test/error_screen.dart';
import 'package:your_reward_user/test/facebook_login.dart';
import 'package:your_reward_user/test/map_screen.dart';

import 'test/widget_screen.dart';

//class này sẽ cấu hình route tới các screen của màn hình
class MyApp extends StatelessWidget {
  final app = new MaterialApp(
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => SplashScreen(),
      '/bottombar': (BuildContext context) => MemberShipScreen(),
      '/test': (BuildContext context) => TestScreen(),
      '/login': (BuildContext context) => LoginScreen(),
      '/signup': (BuildContext context) => SignUpScreen(),
      '/forgotpass': (BuildContext context) => ForgotPassRequestScreen(),
      '/home': (BuildContext context) => HomeScreen(),
      '/carddetail': (BuildContext context) => MemberShipStoreDetailScreen(),
      '/restaurantdetail': (BuildContext context) => RestaurantDetailScreen(),
      '/errorscreen': (BuildContext context) => ErrorScreen(),
      '/accountinfo': (BuildContext context) => AccountInformationScreen(),
      '/test': (BuildContext context) => TestScreen(),
      '/map': (BuildContext context) => GoogleMapScreen(),
      '/facebooklogin': (BuildContext context) => FacebookLoginPage(),
      '/hoorayapi': (BuildContext context) => ApiScreenTest(),
    },
    //unknown route
  );

  @override
  Widget build(BuildContext context) {
    return app;
  }
}
