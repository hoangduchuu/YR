import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/core/injector.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/repository/AuthRepo.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/home/home_screen.dart';
import 'package:your_reward_user/screen/login/login_screen.dart';

import 'bloc/SplashBloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//region scree
/// Reponsitbility to check the user info was saved in local storage and navigate to login or home screen.
class SplashScreen extends BasePage {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
//endregion

//region state
class _SplashScreenState extends BaseState<SplashScreen>{
  SplashBloc _splashBloc;
  bool isValid;
  Timer _timer;
  FirebaseMessaging _firebaseMessaging;
  AuthRepo _authRepo = injector<AuthRepo>();

  String TAG = "[SplashScreen]: ";

  @override
  void initState() {
    super.initState();
    _splashBloc = SplashBloc();
    _checkUserToken(_splashBloc);
    _firebaseMessaging = FirebaseMessaging();
  }

  void gotoLoginScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void gotoHomeScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
            checkDeviceId(context);
          }
          if (state is GetUserInfoErrorState) {
            gotoLoginScreen();
          }
        },
        child: Container(color: Colors.white, child: Image.asset('assets/images/ic_launcher.png', width: 64.0, height: 64.0)));
  }

  Future _checkUserToken([SplashBloc splashBloc]) async {
    String id = await SharedPrefRepo.getUserId();
    String token = await SharedPrefRepo.getToken();

    if (id == null || token == null || id.isEmpty || token.isEmpty) {
      _timer = new Timer(const Duration(milliseconds: 2500), () {
        // cho nó lâu 1 chút
        setState(() {
          gotoLoginScreen();
        });
      });
    } else {
      _splashBloc.dispatch(GetUserInfoEvent(token, id));
    }
  }

  Future<String> getDeviceId() async {
    return _firebaseMessaging.getToken().then((deviceId) {
      return deviceId;
    }).catchError((err) {
      return "ERROR_GET_DEVICE_ID";
    });
  }

  void checkDeviceId(BuildContext context) async {
    String deviceId = await getDeviceId();
    String oldDeviceId = await SharedPrefRepo.getDeviceId();

    print("${TAG} NEW ID: $deviceId ");
    print("${TAG} OLD ID: $oldDeviceId ");

    if (deviceId == "ERROR_GET_DEVICE_ID") {
      super.showErrorWithContext("Có lỗi, vui lòng kiểm tra lại", context);
      return;
    }
    if (deviceId.toString() == oldDeviceId.toString()) {
      print("${TAG} NO NEED UPDATE API CALL");

      gotoHomeScreen();
      return;
    } else {
      print("${TAG}CALLING UPDATE API ");
      _authRepo.updateDeviceId(DataProvider.user.id, deviceId).then((value) {
        print("updateDeviceId SUCCESSS_-----**** ** * ** * * * ** *  $value");
        gotoHomeScreen();
      }).catchError((err) {
        super.showErrorWithContext("Có lỗi, vui lòng kiểm tra lại", context);
      });
    }
  }
}
//endregion
