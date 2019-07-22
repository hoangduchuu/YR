import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/screen/login/login_screen.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/v1/common_button.dart';
import 'package:your_reward_user/widget/v1/textfield.dart';

import 'bloc/request_pass_bloc.dart';
import 'bloc/request_pass_event.dart';
import 'bloc/request_pass_state.dart';

class ChangePassScreen extends BasePage {
  final String email;

  @override
  _ChangePassScreenState createState() => _ChangePassScreenState();

  ChangePassScreen(this.email);
}

class _ChangePassScreenState extends BaseState<ChangePassScreen> with ErrorMessageHandler, ScaffoldPage {
  RequestChangePassBloc _bloc;
  String _code, _newPassword, _reNewpassword;
  bool _backToLogin = false;
  String _submitButtonValue = "Lấy lại mật khẩu";

  @override
  void initState() {
    super.initState();
    _bloc = RequestChangePassBloc();
  }

  @override
  Widget appBar() {
    return AppBar(
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
      title: Text(
        'Quên mật khẩu?',
        style: TextStyle(color: HColors.white, fontFamily: Hfonts.PrimaryFontBold),
      ),
    );
  }

  @override
  Widget body() {
    return _buildBody();
  }

  Widget _buildBody() {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        handleUIControlState(state);
        if (state is ChangePassSuccessState) {
          setState(() {
            _backToLogin = true;
            _submitButtonValue = "Quay lại trang đăng nhập";
          });
          super.showSuccessMessage("Thành công, Bạn có thể đăng nhập với mật khẩu mới", context);
          super.hideLoadingWithContext(context);
        }
      },
      child: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
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
                  'Vui lòng nhập mã xác nhận đã được gữi tới email của bạn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: HColors.white,
                      fontSize: 20,
                      fontFamily: Hfonts.PrimaryFontBold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              YRTextField(
                  hintText: 'Nhập vào mã xác nhận',
                  icon: FontAwesomeIcons.code,
                  onTextChanged: (value) {
                    _code = value;
                  },
                  isPassword: false),
              YRTextField(
                  hintText: 'Password mới',
                  icon: FontAwesomeIcons.key,
                  onTextChanged: (value) {
                    _newPassword = value;
                  },
                  isPassword: true),
              YRTextField(
                  hintText: 'Nhập lại password',
                  icon: FontAwesomeIcons.key,
                  onTextChanged: (value) {
                    _reNewpassword = value;
                  },
                  isPassword: true),
              CommonButton(
                  onPressed: () {
                    _handleCLick(context);
                  },
                  backgroundColor: HColors.ColorSecondPrimary,
                  textColor: HColors.white,
                  text: _submitButtonValue,
                  radiusValue: 10,
                  width: MediaQuery.of(context).size.width * 0.72,
                  buttonPadding: 10),
            ],
          ),
        )
      ]),
    );
  }

  void _handleCLick(BuildContext context) {
    if (_backToLogin) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    _bloc.dispatch(ChangePassEvent(widget.email, _newPassword, _reNewpassword, _code));
  }

  @override
  Color getBgColor() {
    return null;
  }
}
