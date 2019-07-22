import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/entity/enums.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';
import 'package:your_reward_user/widget/v2/common_button.dart';
import 'package:your_reward_user/widget/v2/textfield.dart';

import '../SignupBloc.dart';

class SignUpScreen extends BasePage {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseState<SignUpScreen> with ErrorMessageHandler {
  SignUpBloc _signUpBloc;
  String _email, _password, _repassword, _name, _phone;

  @override
  void initState() {
    super.initState();
    _signUpBloc = new SignUpBloc();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: HColors.bgColor,
      body: _buildBody(),
    );
  }

  @override
  Color getBgColor() {
    return HColors.white;
  }

  Widget _buildBody() {
    return BlocListener(
      bloc: _signUpBloc,
      listener: (context, state) {
        handleUIControlState(state);
        if (state is SignUpSuccessState) {
          super.showSuccessMessage("Đăng ký thành công", context);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Center(
              child: Image.asset(
                'assets/images/ic_launcher.png',
                width: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              child: Center(
                child: YRText(
                  "Đ Ă N G   K Ý",
                  fontSize: 40,
                  textFontStyle: TextFontStyle.BOLD,
                  color: HColors.ColorSecondPrimary,
                ),
              ),
              height: 50,
            ),
            SizedBox(
              height: 15,
            ),
            YRTextField(
              hintText: 'Nhập vào tên tài khoản',
              onTextChanged: (value) {
                _name = value;
              },
              isPassword: false,
            ),
            YRTextField(
                hintText: 'Nhập email',
                onTextChanged: (value) {
                  _email = value;
                },
                isPassword: false),
            YRTextField(
                hintText: 'Nhập mật khẩu',
                onTextChanged: (value) {
                  _password = value;
                },
                isPassword: true),
            YRTextField(
                hintText: 'Xác nhận lại mật khẩu',
                onTextChanged: (value) {
                  _repassword = value;
                },
                isPassword: true),
            YRTextField(
                type: TextInputType.phone,
                hintText: 'Số điện thoại',
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
                model.thumbnail = 'http://your-reward-panel.culidev.com/assets/img/brand/blue.png';
                model.status = "active";
                print("DISPATH SIGN UP");
                _signUpBloc.dispatch(SignUpEvent(model));
              },
              backgroundColor: Colors.amberAccent,
              textColor: HColors.black,
              font: Hfonts.LatoSemiBold,
              text: "Đăng ký",
              width: MediaQuery.of(context).size.width * 0.4,
              buttonPadding: 10,
              radiusValue: 3,
            ),
            Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 222,
                    height: 30,
                    color: HColors.ColorSecondPrimary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 5,
                      color: HColors.ColorSecondPrimary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      "Đã có tài khoản | Đăng nhập ngay",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CommonButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.red,
              textColor: HColors.white,
              font: Hfonts.LatoSemiBold,
              text: "Đăng nhập",
              width: MediaQuery.of(context).size.width * 0.4,
              buttonPadding: 10,
              radiusValue: 3,
            )
          ],
        ),
      ),
    );
  }
}
