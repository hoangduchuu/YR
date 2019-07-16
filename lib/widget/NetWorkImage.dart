import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Use ImageLoad to load any image to show no-image
class ImageLoader extends StatelessWidget {
  String url;
  bool circleImage = false;
  double radius;
  BoxFit boxFit;

  ImageLoader({@required this.url, this.circleImage, this.radius, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(radius == null ? 0 : radius),
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit == null ? BoxFit.cover : boxFit,
          ),
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
}
