import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_bloc.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_event.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_state.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';
import 'package:your_reward_user/widget/v2/common_button.dart';
import 'package:your_reward_user/widget/v2/textfield.dart';

import 'change_passs_screen.dart';

class ForgotPassRequestScreen extends BasePage {
  @override
  _ForgotPassRequestScreenState createState() => _ForgotPassRequestScreenState();
}

class _ForgotPassRequestScreenState extends BaseState<ForgotPassRequestScreen> with ErrorMessageHandler {
  RequestChangePassBloc _bloc;
  String _email;

  @override
  void initState() {
    super.initState();
    _bloc = RequestChangePassBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text(
          'QUÊN MẬT KHẨU',
          style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
        ),
      ),
      backgroundColor: HColors.bgColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          handleUIControlState(state);
          if (state is RequestPassSuccessState) {
            super.hideLoadingWithContext(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassScreen(_email)));
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: YRTextField(
                        font: Hfonts.LatoRegular,
                        hintText: 'Nhập vào email',
                        onTextChanged: (value) {
                          _email = value;
                        },
                        isPassword: false),
                  ),
                  SizedBox(height: 16,),
                  CommonButton(
                      onPressed: () {
                        _handleCLick();
                      },
                      backgroundColor: HColors.ColorPrimary,
                      textColor: HColors.black,
                      font: Hfonts.LatoBold,
                      text: "Gửi Yêu Cầu",
                      width: MediaQuery.of(context).size.width * 0.4,
                      radiusValue: 4,
                      buttonPadding: 2),
                ],
              ),
            ),
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
