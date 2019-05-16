import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';

class MemberCard extends StatefulWidget {
  final String memberName;
  final int memberPoint;
  final String startDate;
  final int times;
  final bool isVIP;
  MemberCard({Key key,@required this.memberName,@required this.memberPoint,@required this.startDate,@required this.times,this.isVIP}):super(key:key);
  @override
  _MemberCardState createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width*0.9,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: new LinearGradient(
            colors: [
              ColorBgFacebook,
              endGradientColor,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(top: 20, left: 10),
                    decoration: new BoxDecoration(
                      color: Colors.white30,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FontAwesomeIcons.userAstronaut,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 5),
                    width: MediaQuery.of(context).size.width * 0.625,
                    child: Text(
                      widget.memberName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(right: 100),
                    child:Column(
                      children: <Widget>[
                        Text(
                          'Điểm tích lũy',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '${widget.memberPoint}',
                          style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                   // margin: EdgeInsets.only(right: 100),
                    child:Column(
                      children: <Widget>[
                        Text(
                          'Ngày tham gia',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          widget.startDate,
                          style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    child:Column(
                      children: <Widget>[
                        Text(
                          'Lần tích điểm',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '${widget.times}',
                          style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            //margin: EdgeInsets.only(left: 20),
            //padding: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.isVIP==true?Icon(FontAwesomeIcons.solidStar,color: Colors.yellowAccent,):Icon(FontAwesomeIcons.userAlt,color: Colors.white,),
                SizedBox(height: 5,),
                widget.isVIP==true?Text('VIP',style: TextStyle(color: Colors.white,fontSize: 15),):Text('Member',style: TextStyle(color: Colors.white,fontSize: 15),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
