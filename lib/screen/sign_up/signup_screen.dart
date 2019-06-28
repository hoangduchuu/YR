import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'dart:ui' as ui;

import 'SignupBloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseState<SignUpScreen> {
  SignUpBloc _signUpBloc;
  String _email, _password, _repassword, _name,_phone;

  @override
  void initState() {
    super.initState();
    _signUpBloc = new SignUpBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: HColors.white, body: _buildBloc());
  }

  Widget _buildBloc() {
    return BlocListener(
      bloc: _signUpBloc,
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          print("_buildBloc SignUpSuccessState ${state.user.toString()}");
        }
        if (state is SignUpErrorState) {
          print("Hide SignUpErrorState ${state.errorMessage}");
        }
        if (state is ResetState) {
          print("reset");
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
                  height: 5,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/copywriter.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                YRTextField(
                  hintText: 'Nhập vào tên tài khoản',
                  icon: FontAwesomeIcons.userCircle,
                  onTextChanged: (value) {
                    _name = value;
                  },
                  isPassword: false,
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
                YRTextField(
                    hintText: 'Xác nhận lại mật khẩu',
                    icon: FontAwesomeIcons.key,
                    onTextChanged: (value) {
                      _repassword = value;
                    },
                    isPassword: true),
                YRTextField(
                  type: TextInputType.phone,
                    hintText: 'Số điện thoại',
                    icon: FontAwesomeIcons.key,
                    onTextChanged: (value) {
                      _phone = value;
                    },
                    isPassword: false),
                CommonButton(
                    onPressed: () {
                      SignupModel model = SignupModel();
                      model.fullName = _name;
                      model.email = _email;
                      model.phone = _phone;
                      model.gender = "male";
                      model.password = _password;
                      model.confirmPasswrod = _repassword;
                      model.thumbnail =
                          'http://your-reward-panel.culidev.com/assets/img/brand/blue.png';
                      model.status = "active";
                      print("DISPATH SIGN UP");
                      _signUpBloc.dispatch(SignUpEvent(model));
                    },
                    backgroundColor: HColors.ColorSecondPrimary,
                    textColor: HColors.white,
                    text: Text(
                      'Đăng ký',
                      style: TextStyle(
                          fontFamily: Hfonts.PrimaryFontBold, fontSize: 16),
                    ),
                    width: MediaQuery.of(context).size.width * 0.72,
                    radiusValue: 10,
                    buttonPadding: 10),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Đã có tài khoản?',
                      style: TextStyle(
                          color: HColors.white,
                          fontFamily: Hfonts.PrimaryFontRegular,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      child: new Text(
                        "Đăng nhập ngay",
                        style: TextStyle(
                            color: HColors.ColorSecondPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Hfonts.PrimaryFontRegular),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {
                            Navigator.pop(context),
                          },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
