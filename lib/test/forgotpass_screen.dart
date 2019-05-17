import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/common_button.dart';
import 'package:your_reward_user/widget/textfield.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HColors.white,
        leading:IconButton(icon: Icon(Icons.arrow_back_ios,color: HColors.ColorSecondPrimary,), onPressed: (){
          Navigator.pop(context);
        }),
        elevation: 0.0,
      ),
      backgroundColor: HColors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text('Quên mật khẩu?',textAlign: TextAlign.center,style: TextStyle(color: HColors.ColorSecondPrimary,fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Icon(
              FontAwesomeIcons.lock,
              size: MediaQuery.of(context).size.width * 0.2,
              color: HColors.ColorSecondPrimary,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              width: MediaQuery.of(context).size.width*0.4,
              child: Text('Hãy nhập email của bạn, sau đó chúng tôi sẽ gửi cho bạn một email hướng dẫn lấy lại mật khẩu',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            YRTextField(
              titleText: 'Email',
              hintText: 'Nhập vào email của bạn',
              onTextChanged: (value) {},
            ),
            CommonButton(
                onPressed: () {},
                backgroundColor: HColors.ColorSecondPrimary,
                textColor: HColors.white,
                text: Text('Gửi'),
                width: MediaQuery.of(context).size.width * 0.45,
                buttonPadding: 13),
          ],
        ),
      ),
    );
  }
}
