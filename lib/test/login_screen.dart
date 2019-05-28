import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'dart:ui' as ui;
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
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
                decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
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
                    onTextChanged: (value) {},
                    isPassword: false),
                YRTextField(
                    hintText: 'Nhập mật khẩu',
                    icon: FontAwesomeIcons.key,
                    onTextChanged: (value) {},
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
                          fontWeight:FontWeight.bold
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {
                            //_showForgotPassSentDialog()
                          },
                    ),
                  ],
                ),
                CommonButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    backgroundColor: HColors.ColorSecondPrimary,
                    textColor: HColors.white,
                    text: Text('Đăng nhập',style: TextStyle(fontFamily: Hfonts.PrimaryFontBold,fontSize: 16),),
                    width: MediaQuery.of(context).size.width * 0.72,
                    buttonPadding: 10,
                    radiusValue: 10,),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Chưa có tài khoản?',style: TextStyle(color: HColors.white,fontFamily: Hfonts.PrimaryFontRegular,fontSize: 17,fontWeight: FontWeight.bold),),
                    FlatButton(
                      child: new Text(
                        "Đăng ký ngay",
                        style: TextStyle(
                            color: HColors.ColorSecondPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Hfonts.PrimaryFontRegular
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: (){
                         Navigator.pushNamed(context, '/signup');
                      }
                    ),
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
                        style: TextStyle(color: HColors.white,fontFamily: Hfonts.PrimaryFontRegular,fontSize: 17,fontWeight: FontWeight.bold),
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
}
