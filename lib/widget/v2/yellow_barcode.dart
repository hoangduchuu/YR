import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';

class YellowBarcode extends StatelessWidget {
  String content;
  double elevation = 12;

  YellowBarcode(this.content, {this.elevation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg_barcode.png"), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 16,),
          Text(
            "Your Rewards",
            style: TextStyle(fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Colors.white70),
          ),
          SizedBox(height: 8,),
          Container(
            padding: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: BarCodeImage(
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
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
