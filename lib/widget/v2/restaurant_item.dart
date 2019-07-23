import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';

class RestaurantItem extends StatefulWidget {
  final String storeName;
  final String storeImage;
  final VoidCallback onClick;
  double width, height;

  RestaurantItem({
    Key key,
    @required this.storeName,
    @required this.storeImage,
    @required this.onClick,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  var selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          selectItem(widget.storeName);
          widget.onClick();
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: widget.height,
              width: widget.width,
              child: ImageLoader(
                overlay: true,
                url: widget.storeImage,
                radius: 15,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              height: widget.height,
              width: widget.width,
              child: Center(
                child: YRText(
                  widget.storeName,
                  color: HColors.white,
                  font: Hfonts.PrimaryFontBold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ));
  }

  selectItem(name) {
    setState(() {
      selectedItem = name;
    });
  }
}
