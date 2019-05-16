import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundIcon extends StatelessWidget {
  String image;
  VoidCallback callback;

  RoundIcon({@required this.image, @required this.callback})
  : assert(image != null), assert(callback != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.callback,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Image.asset(this.image, width: 48, height: 48),
      ),
    );
  }
}
