import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class TransactionRow extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  final int points;

  TransactionRow({this.title, this.description, this.onPressed, this.points});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 32, width: 32, child: Image.asset('assets/images/ic_his_tran.png')),
            SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: HColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 32,
                    height: 4,
                    color: HColors.ColorPrimary,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: HColors.black,
                      )),
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              CommonUtils.getMoneyFormat(points, suffix: '\nĐiểm'),
              maxLines: 2,
              style: TextStyle(color: HColors.ColorPrimary, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
