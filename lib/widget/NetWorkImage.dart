import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String url;

  ImageLoader(this.url);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage("assets/images/coupons.png"),
      image: NetworkImage(url),
    );
  }
}
