import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Use ImageLoad to load any image to show no-image
class ImageLoader extends StatelessWidget {
  String url;
  bool circleImage = false;
  double radius;
  BoxFit boxFit;
  bool overlay;
  double witdh;
  double height;

  ImageLoader(
      {@required this.url,
      this.circleImage,
      this.radius,
      this.boxFit,
      this.overlay = false,
      this.witdh = 100,
      this.height = 100});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: witdh,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(radius == null ? 0 : radius),
          image: DecorationImage(
              image: imageProvider, fit: boxFit == null ? BoxFit.cover : boxFit, colorFilter: getColorFilter()),
        ),
      ),
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Image.asset("assets/images/no_image.png"),
      fadeOutDuration: new Duration(seconds: 1),
      fadeInDuration: new Duration(seconds: 3),
    );
    ;
  }

  ColorFilter getColorFilter() {
    if (overlay == null) {
      return ColorFilter.mode(null, null);
    } else if (overlay) {
      return ColorFilter.mode(Colors.black54, BlendMode.overlay);
    }
    return null;
  }
}
