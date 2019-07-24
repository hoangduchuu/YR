import 'package:flutter/material.dart';
import 'package:your_reward_user/widget/v1/YRText.dart';

class YRAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Color iconColor, titileColor;
  String titleFont;

  YRAppBar({
    this.title = "",
    this.iconColor = Colors.black,
    this.titileColor = Colors.black,
    this.titleFont = "Lato",
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: YRText(
        title,
        color: titileColor,
        font: titleFont,
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevation: 0.0,
      leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
          color: iconColor,
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
