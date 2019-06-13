import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';
import 'dart:ui' as ui;

class AccountInformationScreen extends StatefulWidget {
  @override
  _AccountInformationScreenState createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
////    return Scaffold(
////      backgroundColor: HColors.white,
//      appBar: AppBar(
//        backgroundColor: Colors.transparent,
//        elevation: 0.0,
//        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: HColors.ColorSecondPrimary,), onPressed: (){
//          Navigator.pop(context);
//        }),
//        title: Text('Thông tin',style: TextStyle(color: HColors.ColorSecondPrimary),),
//      ),
////      body: Stack(
    return Stack(
      fit: StackFit.expand,
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
          child: new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: new Container(
              //you can change opacity with color here(I used black) for background.
              decoration:
                  new BoxDecoration(color: Colors.black.withOpacity(0.2)),
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
                  Navigator.pop(context);
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
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1558208846-f197910b7707?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),

                CommonButton(
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  textColor: HColors.white,
                  buttonPadding: 10,
                  text: Text(
                    'Tải ảnh lên',
                    style: TextStyle(color: HColors.white),
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  icon: Icon(
                    FontAwesomeIcons.cameraRetro,
                    color: HColors.white,
                  ),
                ),
                YRTextField(
                  hintText: 'Nhập họ và tên của bạn',
                  onTextChanged: (value) {},
                  isPassword: false,
                  icon: FontAwesomeIcons.userCog,
                ),
                YRTextField(
                    hintText: 'Nhập email',
                    icon: FontAwesomeIcons.envelopeOpen,
                    onTextChanged: (value) {},
                    isPassword: false),
                YRTextField(
                  hintText: 'Nhập vào số điện thoại liên lạc',
                  icon: FontAwesomeIcons.phoneSquare,
                  onTextChanged: (value) {},
                  isPassword: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CommonButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: HColors.ColorSecondPrimary,
                  textColor: HColors.white,
                  text: Text('Lưu lại thông tin',style: TextStyle(fontFamily: Hfonts.PrimaryFontBold,fontSize: 16),),
                  width: MediaQuery.of(context).size.width * 0.72,
                  buttonPadding: 10,
                  radiusValue: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
