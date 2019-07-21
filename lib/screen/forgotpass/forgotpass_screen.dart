import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/base/ScaffoldPage.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';

import 'bloc/request_pass_bloc.dart';
import 'bloc/request_pass_event.dart';
import 'bloc/request_pass_state.dart';
import 'change_passs_screen.dart';

class ForgotPassRequestScreen extends BasePage {
  @override
  _ForgotPassRequestScreenState createState() =>
      _ForgotPassRequestScreenState();
}

class _ForgotPassRequestScreenState extends BaseState<ForgotPassRequestScreen>
    with ErrorMessageHandler {
  RequestChangePassBloc _bloc;
  String _email;

  @override
  void initState() {
    super.initState();
    _bloc = RequestChangePassBloc();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            body: _buildBody(),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
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
          
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          handleUIControlState(state);
          if (state is RequestPassSuccessState) {
            super.hideLoadingWithContext(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangePassScreen(_email)));
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
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
                  hintText: 'Nhập vào email',
                  icon: FontAwesomeIcons.envelopeOpen,
                  onTextChanged: (value) {
                    _email = value;
                  },
                  isPassword: false),
              CommonButton(
                  onPressed: () {
                    _handleCLick();
                  },
                  backgroundColor: HColors.ColorSecondPrimary,
                  textColor: HColors.white,
                  text: "Gữi yêu câu",
                  radiusValue: 10,
                  width: MediaQuery.of(context).size.width * 0.72,
                  buttonPadding: 10),
            ],
          ),
        ));
  }

  void _handleCLick() {
    _bloc.dispatch(RequestPassEvent(_email));
  }

  @override
  Color getBgColor() {
    return null;
  }
}
