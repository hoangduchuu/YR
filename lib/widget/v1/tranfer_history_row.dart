import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';

import 'package:your_reward_user/widget/v1/NetWorkImage.dart';

class TranferHistoryRow extends StatefulWidget {
  final String tranferName;
  final String time;
  final String date;
  final String place;
  final String price;
  final int point;
  final String storeType;

  TranferHistoryRow(
      {Key key,
      @required this.tranferName,
      @required this.storeType,
      @required this.time,
      @required this.date,
      @required this.place,
      @required this.price,
      @required this.point})
      : super(key: key);

  @override
  _TranferHistoryRowState createState() => _TranferHistoryRowState();
}

class _TranferHistoryRowState extends State<TranferHistoryRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(left: 10),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ImageLoader(
              url: widget.storeType,
              boxFit: BoxFit.cover,
              radius: 25,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  widget.tranferName,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: Hfonts.PrimaryFontBold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Vào lúc: ${widget.time}:${widget.date} tại ${widget.place}',
                  style: TextStyle(fontSize: 13, color: HColors.hintTextColor, fontFamily: Hfonts.PrimaryFontBold),
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  widget.price,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: Hfonts.PrimaryFontBold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  '${widget.point} điểm',
                  style: TextStyle(fontSize: 10, fontFamily: Hfonts.PrimaryFontRegular, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
