import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>{
  void showError(String msg){
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text('$msg'),
          backgroundColor: Colors.red));
  }

  void showLoading(){
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Đang tải...')));
  }

  void hideLoading(){
    Scaffold.of(context)..hideCurrentSnackBar();
  }
}