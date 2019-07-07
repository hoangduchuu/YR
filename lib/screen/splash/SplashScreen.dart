import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/test/home_screen.dart';
import 'package:your_reward_user/test/login_screen.dart';

import 'bloc/SplashBloc.dart';

//region scree
/// Reponsitbility to check the user info was saved in local storage and navigate to login or home screen.
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
//endregion

//region state
class _SplashScreenState extends State<SplashScreen> {
  SplashBloc _splashBloc;
  bool isValid;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _splashBloc = SplashBloc();
    _checkUserToken(_splashBloc);
  }

  void gotoLoginScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void gotoHomeScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return BlocListener(
      bloc: _splashBloc,
      listener: (context, state) {
        if (state is GetUserInfoSuccessState) {
          gotoHomeScreen();
        }
        if(state is GetUserInfoErrorState){
          gotoLoginScreen();
        }
      },
      child: Container(
        color: Colors.white,
        child: Image.asset('assets/images/ic_launcher.png', width: 64.0, height: 64.0)
      )
    );
  }

  Future _checkUserToken([SplashBloc splashBloc]) async {
    String id = await SharedPrefRepo.getUserId();
    String token = await SharedPrefRepo.getToken();

    if (id == null || token == null || id.isEmpty || token.isEmpty) {
      _timer = new Timer(const Duration(milliseconds: 2500), () { // cho nó lâu 1 chút
        setState(() {
          gotoLoginScreen();
        });
      });
    } else {
      _splashBloc.dispatch(GetUserInfoEvent(token, id));
    }
  }
}
//endregion
