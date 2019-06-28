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
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Reward"),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocListener(
      bloc: _splashBloc,
      listener: (context, state) {
        if (state is GetUserInfoSuccessState) {
          gotoHomeScreen();
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop),
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Your Reward", // FIXME  use from api =>  item.ownerName;
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
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
