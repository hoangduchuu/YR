import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/model/User.dart';
import 'package:your_reward_user/provider/SharedPrefRepo.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/account_info/profile_bloc.dart';
import 'package:your_reward_user/screen/account_info/profile_state.dart';
import 'package:your_reward_user/screen/base/BaseState.dart';
import 'package:your_reward_user/screen/splash/SplashScreen.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/test/login_screen.dart';
import 'package:your_reward_user/utils/imagePicker/image_picker_handler.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_event.dart';

class AccountInformationScreen extends StatefulWidget {
  @override
  _AccountInformationScreenState createState() => _AccountInformationScreenState();
}

class _AccountInformationScreenState extends BaseState<AccountInformationScreen> with ImagePickerListener, TickerProviderStateMixin {
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
    _emailTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _userTextController.text = DataProvider.user.fullName;
    _emailTextController.text = DataProvider.user.email;
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
          if (state is UploadState) {
            if (state.loading) {
              super.showLoadingWithContext(context);
            }
            if (state.success) {
              print("Uplaod success ${state.uploadedUrl}");
              setState(() {
                DataProvider.user.avatar = state.uploadedUrl;
              });
              super.hideLoadingWithContext(context);
            }
            if (state.error) {
              super.showErrorWithContext(state.errorMessage, context);
              super.hideLoadingWithContext(context);
            }
          }
          if (state is UpdateState) {
            if (state.loading) {
              super.showLoadingWithContext(context);
            }
            if (state.success) {
              super.hideLoadingWithContext(context);
              showSuccessMessage("Thay đổi thông tin thành công", context);
            }
            if (state.error) {
              super.showErrorWithContext(state.errorMessage, context);
              super.hideLoadingWithContext(context);
            }
          }

          if (state is Signout) {
            if (state.state == SignOutState.LOADING) {
              super.showLoadingWithContext(context);
            }
            if (state.state == SignOutState.ERROR) {
              super.showErrorWithContext(state.message, context);
              super.hideLoadingWithContext(context);
            }
            if (state.state == SignOutState.SUCCESS) {
             await SharedPrefRepo.clearAll();
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
            }
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              height: MediaQuery.of(parentContext).size.height,
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
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: HColors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(parentContext);
                    }),
                title: Text(
                  'Thông tin',
                  style: TextStyle(color: HColors.white),
                ),
              ),
              body: Container(
                height: double.maxFinite,
                child: ListView(
                  //shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
//            Container(
//              width: 80.0,
//              height: 80.0,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                image: DecorationImage(
//                  image: NetworkImage(
//                      'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/master/pass/phonepicutres-TA.jpg'),
//                ),
//              ),
//            ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(DataProvider.user.avatar),
                                  fit: BoxFit.cover)),
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
                      text: Text(
                        'Tải ảnh lên',
                        style: TextStyle(color: HColors.white),
                      ),
                      width: MediaQuery.of(parentContext).size.width * 0.4,
                      icon: Icon(
                        FontAwesomeIcons.cameraRetro,
                        color: HColors.white,
                      ),
                    ),
                    YRTextField(
                      textController: _userTextController,
                      hintText: 'Nhập họ và tên của bạn',
                      onTextChanged: (value) {
                        _name = value;
                      },
                      isPassword: false,
                      icon: FontAwesomeIcons.userCog,
                    ),
                    YRTextField(
                        textController: _emailTextController,
                        hintText: 'Nhập email',
                        icon: FontAwesomeIcons.envelopeOpen,
                        onTextChanged: (value) {
                          _email = value;
                        },
                        isPassword: false),
                    YRTextField(
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
                      text: Text(
                        'Lưu lại thông tin',
                        style: TextStyle(fontFamily: Hfonts.PrimaryFontBold, fontSize: 16),
                      ),
                      width: MediaQuery.of(parentContext).size.width * 0.72,
                      buttonPadding: 10,
                      radiusValue: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(parentContext).size.height * 0.03,
                    ),
                    CommonButton(
                      onPressed: () {
                        _profileBloc.dispatch(SignoutEvent(DataProvider.user.id));
                      },
                      backgroundColor: HColors.red,
                      textColor: HColors.white,
                      text: Text(
                        'Đăng xuất',
                        style: TextStyle(fontFamily: Hfonts.PrimaryFontBold, fontSize: 16),
                      ),
                      width: MediaQuery.of(parentContext).size.width * 0.72,
                      buttonPadding: 10,
                      radiusValue: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
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
}
