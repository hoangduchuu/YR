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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: YRText(
          "ĐỔI MẬT KHẨU",
          color: HColors.black,
          font: Hfonts.LatoSemiBold,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HColors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.0,
      ),
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
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 200,
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    YRTextField(
                        font: Hfonts.LatoLight,
                        hintText: 'Nhập vào email',
                        onTextChanged: (value) {
                          _email = value;
                        },
                        isPassword: false),
                    CommonButton(
                        onPressed: () {
                          _handleCLick();
                        },
                        backgroundColor: Colors.amberAccent,
                        textColor: HColors.black,
                        font: Hfonts.LatoSemiBold,
                        text: "Gữi yêu cầu",
                        width: MediaQuery.of(context).size.width * 0.4,
                        radiusValue: 2,
                        buttonPadding: 2),
                  ],
                ),
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
