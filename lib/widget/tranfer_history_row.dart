import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';

class TranferHistoryRow extends StatefulWidget {
  final String tranferName;
  final Color storeColor;
  final String time;
  final String date;
  final String place;
  final String price;
  final bool ispayByCard;

  TranferHistoryRow(
      {Key key,
      @required this.tranferName,
      this.storeColor,
      @required this.time,
      @required this.date,
      @required this.place,
      @required this.price,
      @required this.ispayByCard})
      : super(key: key);

  @override
  _TranferHistoryRowState createState() => _TranferHistoryRowState();
}

class _TranferHistoryRowState extends State<TranferHistoryRow> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(top: 20, left: 10),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            gradient: new LinearGradient(
                colors: [
                  HColors.ColorBgFacebook,
                  HColors.endGradientColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Icon(
            FontAwesomeIcons.userAstronaut,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                widget.tranferName,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                '${widget.time} ngày ${widget.date} tại ${widget.place}',
                style: TextStyle(fontSize: 13, color: HColors.hintTextColor),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                widget.price,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            widget.ispayByCard == true
                ? Icon(
                    FontAwesomeIcons.creditCard,
                    color: HColors.hintTextColor,
                  )
                : Icon(
                    FontAwesomeIcons.moneyBillAlt,
                    color: HColors.hintTextColor,
                  ),
          ],
        )
      ],
    );
  }
}
