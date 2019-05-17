

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/test/main_screen.dart';

import 'test/widget_screen.dart';

//class này sẽ cấu hình route tới các screen của màn hình
class MyApp extends StatelessWidget {

  final app = new MaterialApp(
    routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MainScreen(),
        '/test': (BuildContext context) => TestScreen()
    },
    initialRoute: '/',
    //unknown route
  );

  @override
  Widget build(BuildContext context) {
    return app;
  }
}
