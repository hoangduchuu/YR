import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/NetWorkImage.dart';

class RestaurantItem extends StatefulWidget {
  final String storeName;
  final String storeImage;
  final VoidCallback onClick;

  RestaurantItem({Key key, @required this.storeName, @required this.storeImage, @required this.onClick})
      : super(key: key);

  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  var selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              selectItem(widget.storeName);
              widget.onClick();
            },
            child: Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  width: 190,
                  child: ImageLoader(
                    url: widget.storeImage,
                    radius: 5,
                  ),
                ),
                Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.circular(7), bottomRight: Radius.circular(7)),
                          color: Colors.black54),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Center(
                              child: Text(
                                '${widget.storeName}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Hfonts.PrimaryFontBold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  selectItem(name) {
    setState(() {
      selectedItem = name;
    });
  }
}
