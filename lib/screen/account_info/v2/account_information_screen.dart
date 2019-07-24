import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/account_info/profile_bloc.dart';
import 'package:your_reward_user/screen/account_info/profile_state.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/login/v2/login_screen.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/imagePicker/image_picker_handler.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v2/YRAppBar.dart';
import 'package:your_reward_user/widget/v2/common_button.dart';
import 'package:your_reward_user/widget/v2/textfield.dart';

import '../profile_event.dart';

class AccountInformationScreen extends BasePage {
  @override
  _AccountInformationScreenState createState() => _AccountInformationScreenState();
}

class _AccountInformationScreenState extends BaseState<AccountInformationScreen>
    with ImagePickerListener, TickerProviderStateMixin, ErrorMessageHandler {
  AnimationController _controller;
  ImagePickerHandler imagePicker;
  ProfileBloc _profileBloc;
  String _name, _email, _phone;
  String _avatarUrl = DataProvider.user.avatar;
  TextEditingController _userTextController, _emailTextController, _phoneTextController;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = new ImagePickerHandler(this, _controller);
    imagePicker.init();

    _profileBloc = ProfileBloc();

    _userTextController = TextEditingController();
    _userTextController.text = DataProvider.user.fullName;
    _emailTextController = TextEditingController();
    _emailTextController.text = DataProvider.user.email;
    _phoneTextController = TextEditingController();
    _phoneTextController.text = DataProvider.user.phone;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YRAppBar(
        title: "THÔNG TIN TÀI KHOẢN",
      ),
      key: scaffoldKey,
      backgroundColor: HColors.bgColor,
      body: _buildBloc(context),
    );
  }

  @override
  onImageCropped(File _image) {
    _profileBloc.dispatch(UploadEvent(DataProvider.user.id, _image));
  }

  @override
  onUploaded(File _image, String imgUrl) {
    print("UPLOADING $imgUrl $_image");
    return;
  }

  _buildBloc(BuildContext parentContext) {
    return BlocListener(
      bloc: _profileBloc,
      listener: (context, state) async {
        handleUIControlState(state);
        if (state is UploadSuccessState) {
          print("Upload success ${state.uploadedUrl}");
          setState(() {
            DataProvider.user.avatar = state.uploadedUrl;
          });
          super.hideLoadingWithContext(context);
        } else if (state is UpdateStateSuccess) {
          super.hideLoadingWithContext(context);
          showSuccessMessage("Thay đổi thông tin thành công", context);
          updateChangedData(state.user);
        } else if (state is SignOutSuccess) {
          await SharedPrefRepo.clearAll();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              (Route<dynamic> route) => false);
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: HColors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 140,
                height: 140,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 120,
                      margin: EdgeInsets.only(top: 20, left: 10),
                      decoration: new BoxDecoration(
                        color: Colors.white30,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: ImageLoader(
                          url: DataProvider.user.avatar,
                          radius: 50,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          imagePicker.showDialog(parentContext);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(parentContext).size.height * 0.03,
              ),
              YRTextField(
                defaultText: DataProvider.user.fullName,
                textController: _userTextController,
                hintText: 'Nhập họ và tên của bạn',
                onTextChanged: (value) {
                  _name = value;
                },
                isPassword: false,
              ),
              YRTextField(
                  defaultText: DataProvider.user.email,
                  textController: _emailTextController,
                  hintText: 'Nhập email',
                  onTextChanged: (value) {
                    _email = value;
                  },
                  isPassword: false),
              YRTextField(
                defaultText: DataProvider.user.phone,
                textController: _phoneTextController,
                hintText: 'Nhập vào số điện thoại liên lạc',
                type: TextInputType.number,
                onTextChanged: (value) {
                  _phone = value;
                },
                isPassword: false,
              ),
              SizedBox(
                height: 16,
              ),
              CommonButton(
                onPressed: () => _handleSubmit(),
                backgroundColor: Colors.amberAccent,
                textColor: HColors.black,
                text: 'Lưu Lại Thông Tin',
                width: MediaQuery.of(parentContext).size.width * 0.50,
                radiusValue: 4,
              ),
              SizedBox(
                height: 8,
              ),
              CommonButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                backgroundColor: HColors.red,
                textColor: HColors.white,
                text: 'Đăng Xuất',
                width: MediaQuery.of(parentContext).size.width * 0.50,
                radiusValue: 4,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleSubmit() {
    var newUserInfo = User();
    newUserInfo.email = _emailTextController.text;
    newUserInfo.id = DataProvider.user.id;
    newUserInfo.phone = _phoneTextController.text;
    newUserInfo.fullName = _userTextController.text;

    _profileBloc.dispatch(UpdateUserInfo(newUserInfo));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Hủy"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Xác nhận"),
      onPressed: () {
        Navigator.of(context).pop();
        _profileBloc.dispatch(SignoutEvent(DataProvider.user.id));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Xác nhận"),
      content: Text("Bạn có muốn đăng xuất?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  updateChangedData(User user) {
    setState(() {
      User mUser = DataProvider.user;
      mUser.email = user.email;
      mUser.phone = user.phone;
      mUser.fullName = user.fullName;

      DataProvider.provideData(mUser, DataProvider.userToken);
    });
  }

  @override
  Color getBgColor() {
    return HColors.bgColor;
  }
}
