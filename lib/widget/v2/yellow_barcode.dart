import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:your_reward_user/entity/enums.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';

class YellowBarcode extends StatelessWidget {
  String content;
  double elevation = 12;

  YellowBarcode(this.content, {this.elevation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        elevation: this.elevation,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              color: Colors.amberAccent,
              child: Center(
                child: YRText(
                  "Your Reward",
                  fontSize: 50,
                  textFontStyle: TextFontStyle.BOLD,
                  color: Colors.white70,
                ),
              ),
            ),
            new BarCodeImage(
              barHeight: 80,
              lineWidth: 1.2,
              data: this.content,
              // Code string. (required) //1562165461408
              codeType: BarCodeType.Code128,
              // Code type (required)
              hasText: true,
              // Render with text label or not (default: false)
              onError: (error) {
                // Error handler
                print('error = $error');
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Colors.amberAccent,
            )
          ],
        ),
      ),
    );
  }
}
