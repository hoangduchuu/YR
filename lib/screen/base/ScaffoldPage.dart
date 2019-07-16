import 'package:flutter/material.dart';

import 'BasePage.dart';
import 'BaseState.dart';

mixin ScaffoldPage<page extends BasePage> on BaseState<page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: body(),
      appBar: appBar(),
      backgroundColor: getBgColor() ?? Colors.transparent,
    );
  }

  //abstract build body
  Widget body();

  //abstract build body
  Widget appBar();

  //abstract background color
  Color getBgColor();
}
