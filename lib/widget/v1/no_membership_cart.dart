import 'package:flutter/material.dart';

class NoMemberShipCard extends StatelessWidget {
  String _mesage;

  NoMemberShipCard(String mesage) {
    this._mesage = mesage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: Text(_mesage),
      ),
    );
  }
}
