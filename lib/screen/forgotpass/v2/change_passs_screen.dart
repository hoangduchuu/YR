import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_bloc.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_event.dart';
import 'package:your_reward_user/screen/forgotpass/bloc/request_pass_state.dart';
import 'package:your_reward_user/screen/login/v2/login_screen.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/v2/common_button.dart';
import 'package:your_reward_user/widget/v2/textfield.dart';

class ChangePassScreen extends BasePage {
  final String email;

  @override
  _ChangePassScreenState createState() => _ChangePassScreenState();

  ChangePassScreen(this.email);
}

class _ChangePassScreenState extends BaseState<ChangePassScreen> with ErrorMessageHandler {
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HColors.red,
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
          if (state is ChangePassSuccessState) {
            setState(() {
              _backToLogin = true;
              _submitButtonValue = "Quay lại trang đăng nhập";
            });
            super.showSuccessMessage("Thành công, Bạn có thể đăng nhập với mật khẩu mới", context);
            super.hideLoadingWithContext(context);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 400,
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    YRTextField(
                        hintText: 'Nhập vào mã xác nhận',
                        onTextChanged: (value) {
                          _code = value;
                        },
                        isPassword: false),
                    YRTextField(
                        hintText: 'Password mới',
                        onTextChanged: (value) {
                          _newPassword = value;
                        },
                        isPassword: true),
                    YRTextField(
                        hintText: 'Nhập lại password',
                        onTextChanged: (value) {
                          _reNewpassword = value;
                        },
                        isPassword: true),
                    CommonButton(
                        onPressed: () {
                          _handleCLick(context);
                        },
                        backgroundColor: Colors.amberAccent,
                        textColor: HColors.black,
                        font: Hfonts.LatoSemiBold,
                        text: "Đổi mật khẩu",
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
