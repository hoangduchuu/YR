import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class BarCode extends StatelessWidget {
  String value;

  BarCode({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 10),
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(spacing_16))),
              child: SizedBox(
                width: 21,
                height: 2,
                child: new BarCodeImage(
                  data: value,              // Code string. (required)
                  codeType: BarCodeType.Code128,  // Code type (required)
                  hasText: true,                 // Render with text label or not (default: false)
                  onError: (error) {             // Error handler
                    print('error = $error');
                  },
                ),
              ))),
    );
  }
}
