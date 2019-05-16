import 'package:flutter/widgets.dart';
import 'package:your_reward_user/styles/styles.dart';

class RowInfo extends StatelessWidget {

  String title;
  String info;


  RowInfo({@required this.title,@required this.info})
  : assert(title != null, info != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(this.title, style: HTextStyles.title_left,),
          Text(this.info, style: HTextStyles.info_right,)
        ],
      ),
    );
  }
}
