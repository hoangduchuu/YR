import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';
class Voucher extends StatelessWidget {
  final String name;
  final int discountpercent;
  final String imageUrl;
  final String date;
  const Voucher({Key key,
    @required this.name,
    this.discountpercent,
    @required this.imageUrl,
    @required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildItemCard(context),
      ],
    );
  }
  _buildItemCard(BuildContext context){
    return InkWell(
      onTap: () {
        print(name);
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                    child: Image.network(imageUrl,fit: BoxFit.cover,),
                  ),
                  height: 160,
                  width:160,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 140,
                    child: Text(
                      name,overflow: TextOverflow.ellipsis,maxLines: 1,
                      style: TextStyle(
                          fontSize: 13, color: Color(0xFF424242),fontWeight: FontWeight.bold,fontFamily: Hfonts.PrimaryFontBold),
                    ),
                  ),
                  Container(
                    width: 140,
                    child: Text(
                      'Hết hạn ngày $date',overflow: TextOverflow.ellipsis,maxLines: 1,
                      style: TextStyle(
                          fontSize: 11, color: Color(0xFF424242),fontFamily: Hfonts.PrimaryFontRegular),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
