import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/account_info/profile_bloc.dart';
import 'package:your_reward_user/screen/account_info/profile_state.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/base/ErrorMessageHandler.dart';
import 'package:your_reward_user/screen/login/login_screen.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/utils/imagePicker/image_picker_handler.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v1/common_button.dart';
import 'package:your_reward_user/widget/v1/textfield.dart';

import 'profile_event.dart';

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
    return Stack(
      children: <Widget>[
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
        ),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: _buildBloc(context),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: HColors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
      ],
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
        height: double.maxFinite,
        child: ListView(
          //shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(parentContext).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
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
              ],
            ),
            CommonButton(
              onPressed: () {
                imagePicker.showDialog(parentContext);
              },
              backgroundColor: Colors.transparent,
              textColor: HColors.white,
              buttonPadding: 10,
              text: 'Tải ảnh lên',
              width: MediaQuery.of(parentContext).size.width * 0.4,
              icon: Icon(
                FontAwesomeIcons.cameraRetro,
                color: HColors.white,
              ),
            ),
            YRTextField(
              defaultText: DataProvider.user.fullName,
              textController: _userTextController,
              hintText: 'Nhập họ và tên của bạn',
              onTextChanged: (value) {
                _name = value;
              },
              isPassword: false,
              icon: FontAwesomeIcons.userCog,
            ),
            YRTextField(
                defaultText: DataProvider.user.email,
                textController: _emailTextController,
                hintText: 'Nhập email',
                icon: FontAwesomeIcons.envelopeOpen,
                onTextChanged: (value) {
                  _email = value;
                },
                isPassword: false),
            YRTextField(
              defaultText: DataProvider.user.phone,
              textController: _phoneTextController,
              hintText: 'Nhập vào số điện thoại liên lạc',
              icon: FontAwesomeIcons.phoneSquare,
              type: TextInputType.number,
              onTextChanged: (value) {
                _phone = value;
              },
              isPassword: false,
            ),
            SizedBox(
              height: MediaQuery.of(parentContext).size.height * 0.03,
            ),
            CommonButton(
              onPressed: () => _handleSubmit(),
              backgroundColor: HColors.ColorSecondPrimary,
              textColor: HColors.white,
              text: 'Lưu lại thông tin',
              width: MediaQuery.of(parentContext).size.width * 0.72,
              buttonPadding: 10,
              radiusValue: 10,
            ),
            SizedBox(
              height: MediaQuery.of(parentContext).size.height * 0.03,
            ),
            CommonButton(
              onPressed: () {
                showAlertDialog(context);
              },
              backgroundColor: HColors.red,
              textColor: HColors.white,
              text: 'Đăng xuất',
              width: MediaQuery.of(parentContext).size.width * 0.72,
              buttonPadding: 10,
              radiusValue: 10,
            )
          ],
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

    print("SCREEN  $newUserInfo");
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
    return null;
  }
}
