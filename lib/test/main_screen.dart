import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index == 0) {
              return getTitle('SignIn Screen', (){});
            } else if (index == 1) {
              return getTitle('ForgotPass Screen', (){});
            } else
            if (index == 2) {
              return getTitle('Main Screen', (){});
            } else if (index == 3) {
              return getTitle('Main Screen', (){});
            } else if (index == 4) {
              return getTitle('Card Screen', (){});
            } else if (index == 5) {
              return getTitle('Restaurant Screen', (){});
            } else
            if (index == 6) {
              return getTitle('Account Screen', (){});
            } else if (index == 7) {
              return getTitle('Error Screen', (){});
            } else {
              return getTitle('Test Screen', (){
                Navigator.pushNamed(context, '/test');
              });
            }
          }),
    );
  }

  Widget getTitle(String title, VoidCallback callback) {
    return InkWell(onTap: callback, child: Container(
        height: 48,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))
        ),
        child: Text(title)));
  }
}
