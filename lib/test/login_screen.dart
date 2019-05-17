import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HColors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Icon(
              FontAwesomeIcons.wallet,
              size: MediaQuery.of(context).size.width * 0.2,
              color: HColors.ColorSecondPrimary,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            YRTextField(
              titleText: 'Email',
              hintText: 'Nhập vào email',
              onTextChanged: (value) {},
            ),
            YRTextField(
              titleText: 'Mật khẩu',
              hintText: 'Nhập vào mật khẩu',
              onTextChanged: (value) {},
              isPassword: true,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: new Text(
                    "Quên mật khẩu?",
                    style: TextStyle(
                      fontFamily: "oscinebold",
                      color: HColors.black,
                      fontSize: 15.0,
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
                  //todo
                  Navigator.pushNamed(context, '/home');
                },
                backgroundColor: HColors.ColorSecondPrimary,
                textColor: HColors.white,
                text: Text('Đăng nhập'),
                width: MediaQuery.of(context).size.width * 0.45,
                buttonPadding: 13),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration:
                          BoxDecoration(border: Border.all(width: 0.25)),
                    ),
                  ),
                  Text(
                    "Hoặc đăng nhập với",
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: "oscinebold",
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      margin: EdgeInsets.all(8.0),
                      decoration:
                          BoxDecoration(border: Border.all(width: 0.25)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.005,),
            CommonButton(
                onPressed: (){

                },
                icon: Icon(FontAwesomeIcons.facebookF),
                backgroundColor: HColors.ColorBgFacebook,
                textColor: HColors.white,
                buttonPadding: 10),
          ],
        ),
      ),
    );
  }
}
