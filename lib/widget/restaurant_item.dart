import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';


class RestaurantItem extends StatefulWidget {
  final String storeName;
  final String storeImage;
  RestaurantItem({Key key,@required this.storeName,@required this.storeImage}):super(key:key);
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
          color: Colors.white,borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                  child: Image.network(widget.storeImage,fit: BoxFit.cover,),
                ),
                height: 100,
                width:100,
              ),
              InkWell(
                onTap: () {
                  selectItem(widget.storeName);
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 7.0),
          Text(
            widget.storeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,fontWeight: FontWeight.bold
            ),
          )
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
