import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/bloc/login/login_bloc.dart';
import 'package:your_reward_user/bloc/login/login_event.dart';
import 'package:your_reward_user/bloc/login/login_state.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc _loginBloc;
  String _email = "huu@example.com";
  String _password = "john.doe";
  String _token;
  FirebaseMessaging _firebaseMessaging;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging = new FirebaseMessaging();
    _loginBloc = LoginBloc();
    SharedPrefRepo.getToken().then((token) {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocListener(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoggedInState) {
          if (state.isInvalidInput) {
            super.showErrorWithContext(state.errorMsg, context);
            super.hideLoadingWithContext(context);
          }
          if (state.isSubmitting) {
            super.showLoadingWithContext(context);
          }
          if (state.isSuccess) {
            super.hideLoadingWithContext(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } if (state.isFailure) {
            super.hideLoadingWithContext(context);
            super.showErrorWithContext("${state.errorMsg}",context);
          }
        }

      },
      child: Stack(
        fit: StackFit.expand,
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
            child: new BackdropFilter(
              filter: new ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: new Container(
                //you can change opacity with color here(I used black) for background.
                decoration:
                    new BoxDecoration(color: Colors.black.withOpacity(0.2)),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/coupons.png',
                    width: MediaQuery.of(context).size.width * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                YRTextField(
                    hintText: 'Nhập email',
                    icon: FontAwesomeIcons.envelopeOpen,
                    onTextChanged: (value) {
                      _email = value;
                    },
                    isPassword: false),
                YRTextField(
                    hintText: 'Nhập mật khẩu',
                    icon: FontAwesomeIcons.key,
                    onTextChanged: (value) {
                      _password = value;
                    },
                    isPassword: true),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: new Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                            fontFamily: Hfonts.PrimaryFontRegular,
                            color: HColors.ColorSecondPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () =>
                          {Navigator.pushNamed(context, "/forgotpass")},
                    ),
                  ],
                ),
                CommonButton(
                  onPressed: () => {_onSubmitLogin(context)},
                  backgroundColor: HColors.ColorSecondPrimary,
                  textColor: HColors.white,
                  text: Text(
                    'Đăng nhập',
                    style: TextStyle(
                        fontFamily: Hfonts.PrimaryFontBold, fontSize: 16),
                  ),
                  width: MediaQuery.of(context).size.width * 0.72,
                  buttonPadding: 10,
                  radiusValue: 10,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Chưa có tài khoản?',
                      style: TextStyle(
                          color: HColors.white,
                          fontFamily: Hfonts.PrimaryFontRegular,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                        child: new Text(
                          "Đăng ký ngay",
                          style: TextStyle(
                              color: HColors.ColorSecondPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: Hfonts.PrimaryFontRegular),
                          textAlign: TextAlign.end,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        }),
                  ],
                ),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Hoặc đăng nhập với",
                        style: TextStyle(
                            color: HColors.white,
                            fontFamily: Hfonts.PrimaryFontRegular,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                CommonButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.facebookF),
                    backgroundColor: HColors.ColorBgFacebook,
                    textColor: HColors.white,
                    radiusValue: 10,
                    width: MediaQuery.of(context).size.width * 0.72,
                    buttonPadding: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onSubmitLogin(BuildContext context) async {
    String deviceId = await getDeviceId();
    _loginBloc.dispatch(LoginRequest(email: _email, password: _password,deviceId: deviceId));
  }

  Future<String> getDeviceId() async {
    return _firebaseMessaging.getToken().then((deviceId) {
      return deviceId;
    }).catchError((err) {
      return "ERROR_GET_DEVICE_ID";
    });
  }
}
