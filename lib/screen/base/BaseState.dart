import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_reward_user/utils/progress_dialog.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProgressDialog _progressBar;

  void showError(String msg) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          SnackBar(content: Text('$msg'), backgroundColor: Colors.red));
  }

  void showError2(String msg, BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          SnackBar(content: Text('$msg'), backgroundColor: Colors.red));
    if (_progressBar != null && _progressBar.isShowing()) {
      _progressBar.hide(context);
    }
  }

  void showLoading2(BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Đang tải...')));
    if (_progressBar == null) {
      _progressBar = new ProgressDialog(context, ProgressDialogType.Normal);
    }
    _progressBar.show(context);
  }

  void showLoading() {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Đang tải...')));
  }

  void hideLoading() {
    Scaffold.of(context)..hideCurrentSnackBar();
    if (_progressBar != null && _progressBar.isShowing()) {
      _progressBar.hide(context);
    }
  }

  void hideLoading2(BuildContext context) {
    Scaffold.of(context)..hideCurrentSnackBar();
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
