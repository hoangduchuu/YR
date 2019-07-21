import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_reward_user/utils/progress_dialog.dart';
import 'package:your_reward_user/widget/custom_dialog.dart';

class NotificationManager {
  FirebaseMessaging _firebaseMessaging;
  ProgressDialog progressDialog;
  BuildContext _context;

  NotificationManager(BuildContext context) {
    this._firebaseMessaging = FirebaseMessaging();
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    this._context = context;
  }

  void register() {
    if (Platform.isIOS) {
      iOS_Permission();
    }
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('*("2 register ********* on message $message');
        var title = message['notification']['title'];
        var body = message['notification']['body'];
        _showDialog(_context, title, body);
      },
      onResume: (Map<String, dynamic> message) async {
        print(' 2register ********** on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('2 register ********** on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {});
  }

  void _showDialog(BuildContext context, String title, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: body,
        buttonText: " Xác nhận",
      ),
    );
  }
}
