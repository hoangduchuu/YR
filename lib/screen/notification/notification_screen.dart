import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/styles/styles.dart';

import 'notification_row.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
          onPressed: () {
            Navigator.pop(context);
          }, color: Colors.black,),
        title: Text(
          'THÔNG BÁO',
          style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
        ),
      ),
      backgroundColor: HColors.bgColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        itemBuilder:_buildProductItem,
        itemCount: 10,
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return NotificationRow(
      title: 'Hướng dẫn trở thành thành viên',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    );
  }
}
