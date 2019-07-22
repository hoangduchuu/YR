import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationRow extends StatelessWidget {
  String title;
  String description;

  NotificationRow({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                height: 32,
                  width: 32,
                  child: Image.asset('assets/images/ic_notifi_2.png')),
              SizedBox(width: 8,),
              Text(
                this.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2, overflow: TextOverflow.ellipsis
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            this.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis
          )
        ],
      ),
    );
  }
}
