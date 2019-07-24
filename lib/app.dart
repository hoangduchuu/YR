import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/screen/account_info/v2/account_information_screen.dart';
import 'package:your_reward_user/screen/forgotpass/v2/forgotpass_screen.dart';
import 'package:your_reward_user/screen/home/home_screen.dart';
import 'package:your_reward_user/screen/login/v2/login_screen.dart';
import 'package:your_reward_user/screen/membership/detail/v2/card_store_detail_screen.dart';
import 'package:your_reward_user/screen/membership/membership_screen.dart';
import 'package:your_reward_user/screen/notification/notification_screen.dart';
import 'package:your_reward_user/screen/restaurant_detail/restaurant_detail_screen.dart';
import 'package:your_reward_user/screen/sign_up/v2/signup_screen.dart';
import 'package:your_reward_user/screen/splash/SplashScreen.dart';
import 'package:your_reward_user/test/api_test_screen.dart';
import 'package:your_reward_user/test/error_screen.dart';
import 'package:your_reward_user/test/facebook_login.dart';
import 'package:your_reward_user/test/map_screen.dart';

import 'test/widget_screen.dart';

//class này sẽ cấu hình route tới các screen của màn hình
class MyApp extends StatelessWidget {
  final app = new MaterialApp(
    theme: ThemeData(fontFamily: 'Lato'),
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
      '/notification': (BuildContext context) => NotificationScreen(),
    },
    debugShowCheckedModeBanner: false,
    //unknown route
  );

  @override
  Widget build(BuildContext context) {
    return app;
  }
}
