import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/core/base_provider/base_view.dart';
import 'package:your_reward_user/core/base_provider/view_states.dart';
import 'package:your_reward_user/model/notification.dart';
import 'package:your_reward_user/repository/DataProvider.dart';
import 'package:your_reward_user/screen/notification/notification_viewmodel.dart';
import 'package:your_reward_user/styles/styles.dart';
import 'package:your_reward_user/widget/v2/shimmer/shimmer_list.dart';

import 'notification_row.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationViewModel>(
      onModelReady: (model) => {_handleModelReady(model)},
      builder: (context, model, child) => Scaffold(
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            elevation: 0.0,
            leading: IconButton(
              icon: ImageIcon(AssetImage('assets/images/ic_arrow.png')),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black,
            ),
            title: Text(
              'THÔNG BÁO',
              style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
            ),
          ),
          backgroundColor: HColors.bgColor,
          body: buildListNotification(model),
        ),
      ),
    );
  }

  Widget buildListNotification(NotificationViewModel model) {
    List<NotificationModel> notifications = model.notifications;
    if (model.state == ViewState.Busy) {
      return ListShimmer();
    }
    if (notifications == null || notifications.isEmpty) {
      return Container();
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return NotificationRow(
          title: notifications[index].title,
          description: notifications[index].content,
        );
      },
      itemCount: notifications.length,
    );
  }

  _handleModelReady(NotificationViewModel model) {
    model.getNotification(DataProvider.user.id);
  }
}
