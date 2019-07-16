import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/styles.dart';

class ErrorScreen extends StatefulWidget {
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset(
                'assets/images/cancel.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Lỗi',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ButtonTheme(
                child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: HColors.ColorSecondPrimary), borderRadius: BorderRadius.circular(10)),
              child: FlatButton(onPressed: () {}, child: Text('Thử lại')),
            )),
          ],
        ),
      ),
    );
  }
}
