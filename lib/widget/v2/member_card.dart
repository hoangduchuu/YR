import 'package:flutter/material.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/widget/v1/NetWorkImage.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';

class MemberCard extends StatelessWidget {
  final String memberName;
  final int memberPoint;
  final String startDate;
  final int times;
  final bool isVIP;
  final String title;
  final String cardBackgoundImage;
  final String cardLogo;

  MemberCard({
    this.memberName,
    this.memberPoint,
    this.startDate,
    this.times,
    this.isVIP,
    this.title,
    this.cardBackgoundImage =
        "https://i-vnexpress.vnecdn.net/2019/07/23/671379172603107756389039633334-5964-8510-1563875022_r_500x300.jpg",
    this.cardLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          ImageLoader(
            radius: 20,
            height: 200,
            witdh: MediaQuery.of(context).size.width,
            url:
                "https://i-vnexpress.vnecdn.net/2019/07/23/671379172603107756389039633334-5964-8510-1563875022_r_500x300.jpg",
            boxFit: BoxFit.fill,
            overlay: true,
          ),
          Container(
            padding: EdgeInsets.only(right: 20, top: 20),
            alignment: Alignment.topRight,
            child: YRText(
              "Bạc",
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ImageLoader(
              witdh: 50,
              height: 50,
              url: DataProvider.user.avatar,
              radius: 25,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(top: 20),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(right: 100),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Điểm tích lũy',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontFamily: Hfonts.PrimaryFontRegular),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Hfonts.PrimaryFontBold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            // margin: EdgeInsets.only(right: 100),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Lần tích điểm',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontFamily: Hfonts.PrimaryFontRegular),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Hfonts.PrimaryFontBold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            // margin: EdgeInsets.only(right: 100),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Ngày tham gia',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white, fontFamily: Hfonts.PrimaryFontRegular),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Hfonts.PrimaryFontBold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
