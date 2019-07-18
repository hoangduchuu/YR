import 'dart:convert';
import 'dart:ui' as ui;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/home/home_screen.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';

import 'bloc/login/login_bloc.dart';
import 'bloc/login/login_event.dart';
import 'bloc/login/login_state.dart';

class LoginScreen extends BasePage {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> with ErrorMessageHandler {
  LoginBloc _loginBloc;
  String _email = "huu@example.com";
  String _password = "john.doe";
  String _token;
  String _phone, _facebookId, _deviceId, _facebookEmail, _fullname;
  FirebaseMessaging _firebaseMessaging;
  BuildContext _context;

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
    return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child:  Scaffold(
              backgroundColor: Colors.transparent,
              body: _buildBody(),
            ),
          );
  }

  @override
  Color getBgColor() {
    return null;
  }

  _buildBody() {
    return BlocListener(
      bloc: _loginBloc,
      listener: (context, state) {
        handleUIControlState(state);
        if (state is LoggedInSuccess) {
          super.hideLoading();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (state is LoggedInFacebookState) {
          _showPhoneInputDialog(super.scaffoldKey.currentContext);
        }
      },
      child:
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
                      onPressed: () => {Navigator.pushNamed(context, "/forgotpass")},
                    ),
                  ],
                ),
                CommonButton(
                  onPressed: () => {_onSubmitLogin(context)},
                  backgroundColor: HColors.ColorSecondPrimary,
                  textColor: HColors.white,
                  text: Text(
                    'Đăng nhập',
                    style: TextStyle(fontFamily: Hfonts.PrimaryFontBold, fontSize: 16),
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
                    onPressed: () {
                      _onSubmitFbLogin(context);
                    },
                    icon: Icon(FontAwesomeIcons.facebookF),
                    backgroundColor: HColors.ColorBgFacebook,
                    textColor: HColors.white,
                    radiusValue: 10,
                    width: MediaQuery.of(context).size.width * 0.72,
                    buttonPadding: 10),
              ],
            ),
          ),
    );
  }

  _onSubmitLogin(BuildContext context) async {
    String deviceId = await getDeviceId();
    _loginBloc.dispatch(LoginRequest(email: _email, password: _password, deviceId: deviceId));
  }

  _onSubmitFbLogin(BuildContext context) async {
    try {
      var facebookSignIn = FacebookLogin();
      final result = await facebookSignIn.logInWithReadPermissions(['email', 'public_profile']);
      final token = result.accessToken.token;
      final graphResponse = await http
          .get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${"$token"}');
      final profile = json.decode(graphResponse.body);
      _fullname = profile['name'];
      _facebookEmail = profile['email'];
      _facebookId = profile['id'];
      _deviceId = await getDeviceId();
      _loginBloc.dispatch(LoginFacebookRequest(_facebookEmail, _fullname, _facebookId, _deviceId, null));
    } catch (e) {
      super.showErrorToast(_context, "Có lỗi: ${e.toString()}");
    }
  }

  Future<String> getDeviceId() async {
    return _firebaseMessaging.getToken().then((deviceId) {
      return deviceId;
    }).catchError((err) {
      return "ERROR_GET_DEVICE_ID";
    });
  }

  Future<String> _showPhoneInputDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Một bước nữa thôi, vui lòng nhập số điện thoại để hoàn tất'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Số điện thoại', hintText: '0919991991'),
                onChanged: (value) {
                  _phone = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Xác nhận'),
              onPressed: () => _handleLoginWithFacebookAndSubmitedPhone(_context),
            ),
          ],
        );
      },
    );
  }

  _handleLoginWithFacebookAndSubmitedPhone(BuildContext context) {
    _loginBloc.dispatch(LoginFacebookRequest(_facebookEmail, _fullname, _facebookId, _deviceId, _phone));
    Navigator.of(context).pop(_phone);
  }
}
