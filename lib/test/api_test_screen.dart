import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/data/AuthRepo.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/utils/log_prefix.dart';

class ApiScreenTest extends StatefulWidget {
  @override
  _ApiScreenTestState createState() => _ApiScreenTestState();
}

class _ApiScreenTestState extends State<ApiScreenTest> {
  AuthRepo repo;
  var _loginStatus = "Login";

  @override
  void initState() {
    repo = AuthRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HColors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HColors.ColorSecondPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.userCircle,
                color: HColors.ColorSecondPrimary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/accountinfo');
              }),
        ],
        elevation: 0.0,
      ),
      backgroundColor: HColors.white,
      body: Center(
          child: RaisedButton(
        onPressed: _onAuthenticationLogin,
        child: Text(_loginStatus),
      )),
    );
  }

  void _onAuthenticationLogin() {
    print(LogPrefix.methodName("Authentication (login)"));
    repo.login("huu@example.com", "john.doe").then((onValue) {
      print(LogPrefix.okResponse(onValue));
    }).catchError((e) {
      print(LogPrefix.errorResponse(e));
    });
  }
}
