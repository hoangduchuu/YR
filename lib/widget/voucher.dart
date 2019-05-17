import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';
class Voucher extends StatelessWidget {
  final String name;
  final bool isPlusOne;
  final bool isFree;
  final bool isDiscount;
  final int discountpercent;
  final String imageUrl;
  final String date;
  const Voucher({Key key,
    @required this.name,
    this.isDiscount,
    this.isFree,
    this.isPlusOne,
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
                isDiscount==true?Positioned(
                    width: 25,
                    height: 16,
                    child: new Container(
                      width: 25,
                      height: 16,
                      decoration: new BoxDecoration(color: HColors.reddishPink,boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 2)],borderRadius: BorderRadius.circular(2)),
                      child: Center(child: Text('-$discountpercent%',style: TextStyle(fontSize: 9,color: Colors.white),)),
                    )
                ):SizedBox.shrink(),
                isFree==true? Positioned(
                    width: 25,
                    height: 16,
                    child: new Container(
                      width: 35,
                      height: 12,
                      decoration: new BoxDecoration(color: HColors.weirdGreen,boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 2)],borderRadius: BorderRadius.circular(2)),
                      child: Center(child: Text('Free',style: TextStyle(fontSize: 8,color: Colors.white),)),
                    )
                ):SizedBox.shrink(),
                isPlusOne==true? Positioned(
                    width: 25,
                    height: 16,
                    child: new Container(
                      width: 35,
                      height: 12,
                      decoration: new BoxDecoration(color: HColors.deepSkyBlue,boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 2)],borderRadius: BorderRadius.circular(2)),
                      child: Center(child: Text('+1',style: TextStyle(fontSize: 8,color: Colors.white),)),
                    )
                ):SizedBox.shrink(),
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
                          fontSize: 12, color: Color(0xFF424242),fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 140,
                    child: Text(
                      'Hết hạn ngày $date',overflow: TextOverflow.ellipsis,maxLines: 1,
                      style: TextStyle(
                          fontSize: 10, color: Color(0xFF424242)),
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
