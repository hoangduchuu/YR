import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';


class RestaurantItem extends StatefulWidget {
  final String storeName;
  final String storeImage;
  final VoidCallback onClick;
  RestaurantItem({Key key,
    @required this.storeName,
    @required this.storeImage, @required this.onClick}):super(key:key);
  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  var selectedItem = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage( image: NetworkImage(widget.storeImage),
                    fit: BoxFit.cover
                  )
                ),
                
                height: 150,
                width:100,
              ),
              InkWell(
                onTap: () {
                  selectItem(widget.storeName);
                  widget.onClick();
                },
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7)),
                      color: Colors.black54
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width*0.25,
                          child:  Center(
                            child: Text(
                              '${widget.storeName}',
                              textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14,color: HColors.white,fontWeight: FontWeight.bold,fontFamily: Hfonts.PrimaryFontBold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
  selectItem(name) {
    setState(() {
      print(name);
      selectedItem = name;
    });
  }

}
