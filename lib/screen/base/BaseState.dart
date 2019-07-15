import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/screen/base/BasePage.dart';
import 'package:your_reward_user/utils/notification_util.dart';
import 'package:your_reward_user/utils/progress_dialog.dart';

abstract class BaseState<page extends BasePage> extends State<page> {
  ProgressDialog _progressBar;
  NotificationManager notificationManager;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    notificationManager = NotificationManager(context);
    notificationManager.register();
  }

  void showError(String msg) {
    scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$msg'), backgroundColor: Colors.red));
  }

  void hideMsg(){
    scaffoldKey.currentState
      ..hideCurrentSnackBar();
  }

  void hideLoading() {
    if (_progressBar != null && _progressBar.isShowing()) {
      _progressBar.hide(context);
    }
  }

  void showLoading() {
    if (_progressBar == null) {
      _progressBar = new ProgressDialog(context, ProgressDialogType.Normal);
    }
    _progressBar.show(context);
  }


  void showErrorWithContext(String msg, BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          SnackBar(content: Text('$msg'), backgroundColor: Colors.red));
  }

  void showLoadingWithContext(BuildContext context) {
    if (_progressBar == null) {
      _progressBar = new ProgressDialog(context, ProgressDialogType.Normal);
    }
    _progressBar.show(context);
  }


  void hideLoadingWithContext(BuildContext context) {
    if (_progressBar != null && _progressBar.isShowing()) {
      _progressBar.hide(context);
    }
  }

  void showSuccessMessage(String msg, BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          SnackBar(content: Text('$msg'), backgroundColor: Colors.green));
    if (_progressBar != null && _progressBar.isShowing()) {
      _progressBar.hide(context);
    }
  }
}
