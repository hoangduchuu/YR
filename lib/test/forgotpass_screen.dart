import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'dart:ui' as ui;

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
////    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: HColors.white,
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back_ios,
//              color: HColors.ColorSecondPrimary,
//            ),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//        elevation: 0.0,
//      ),
////      backgroundColor: HColors.white,
////      body: Stack(
    return Stack(
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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: HColors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            elevation: 0.0,
            title: Text('Quên mật khẩu?',style: TextStyle(color: HColors.white,fontFamily: Hfonts.PrimaryFontBold),),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/password.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    'Hãy nhập email của bạn, sau đó chúng tôi sẽ gửi cho bạn một email hướng dẫn lấy lại mật khẩu',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,color: HColors.white, fontSize: 20,fontFamily: Hfonts.PrimaryFontBold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                YRTextField(
                    hintText: 'Nhập vào email',
                    icon: FontAwesomeIcons.envelopeOpen,
                    onTextChanged: (value) {},
                    isPassword: false),
                CommonButton(
                    onPressed: () {},
                    backgroundColor: HColors.ColorSecondPrimary,
                    textColor: HColors.white,
                    text: Text('Lấy lại mật khẩu',style: TextStyle(fontFamily: Hfonts.PrimaryFontBold,fontSize: 16),),
                    radiusValue: 10,
                    width: MediaQuery.of(context).size.width * 0.72,
                    buttonPadding: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
