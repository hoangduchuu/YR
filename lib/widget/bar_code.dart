import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/styles/styles.dart';

class BarCode extends StatelessWidget {
  String imageLink;

  BarCode({@required this.imageLink}) : assert(imageLink != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: new Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
          margin: EdgeInsets.all(spacing_16),
          decoration: BoxDecoration(
              border: new Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(spacing_16))),
          child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(spacing_16))),
              child: Image.asset('assets/images/bar_code.jpg'))),
    );
  }
}
