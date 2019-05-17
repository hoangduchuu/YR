import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            YRTextField(
              titleText: 'Tên tài khoản',
              hintText: 'Nhập vào tên tài khoản',
              onTextChanged: (value) {},
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
            YRTextField(
              titleText: 'Mật khẩu xác nhận',
              hintText: 'Xác nhận mật khẩu',
              onTextChanged: (value) {},
              isPassword: true,
            ),
            CommonButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: HColors.endGradientColor,
                textColor: HColors.white,
                text: Text('Đăng ký'),
                width: MediaQuery.of(context).size.width * 0.45,
                buttonPadding: 13),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: new Text(
                    "Đã có tài khoản?",
                    style: TextStyle(
                      fontFamily: "oscinebold",
                      color: HColors.black,
                      fontSize: 15.0,
                    ),
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
    );
  }
}
