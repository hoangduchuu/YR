import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';

class AccountInformationScreen extends StatefulWidget {
  @override
  _AccountInformationScreenState createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HColors.white,
      appBar: AppBar(
        backgroundColor: HColors.ColorSecondPrimary,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        }),
        title: Text('Thông tin',style: TextStyle(color: HColors.white),),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.camera), onPressed: (){

          }),
        ],
      ),
      body: Center(
        child: ListView(
          //shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/master/pass/phonepicutres-TA.jpg'),
                ),
              ),
            ),
            CommonButton(
              onPressed: () {},
              backgroundColor: Colors.transparent,
              textColor: HColors.white,
              buttonPadding: 10,
              text: Text(
                'Tải ảnh lên',
                style: TextStyle(color: HColors.hintTextColor),
              ),
              width: MediaQuery.of(context).size.width*0.4,
              icon: Icon(FontAwesomeIcons.cameraRetro,color: HColors.hintTextColor,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            YRTextField(
              titleText: 'Họ và Tên',
              hintText: 'Nhập họ và tên của bạn',
              onTextChanged: (value) {},
            ),
            YRTextField(
              titleText: 'Email',
              hintText: 'Nhập vào email',
              onTextChanged: (value) {},
            ),
            YRTextField(
              titleText: 'Số điện thoại',
              hintText: 'Nhập vào số điện thoại liên lạc',
              onTextChanged: (value) {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CommonButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: HColors.saveButtonColor,
                textColor: HColors.white,
                text: Text('Lưu lại thông tin'),
                width: MediaQuery.of(context).size.width * 0.45,
                buttonPadding: 13,
            radiusValue: 5,),
          ],
        ),
      ),
    );
  }
}
