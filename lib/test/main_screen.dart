import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'api_test_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            if (index == 0) {
              return getTitle('SignIn Screen', (){
                Navigator.pushNamed(context, '/login');
              });
            } else if (index == 1) {
              return getTitle('ForgotPass Screen', (){
                Navigator.pushNamed(context, '/forgotpass');
              });
            } else
            if (index == 2) {
              return getTitle('Main Screen', (){
                Navigator.pushNamed(context, '/home');
              });
            } else if (index == 3) {
              return getTitle('Main Screen', (){});
            } else if (index == 4) {
              return getTitle('Card Screen', (){
                Navigator.pushNamed(context, '/carddetail');
              });
            } else if (index == 5) {
              return getTitle('Restaurant Screen', (){
                Navigator.pushNamed(context, '/restaurantdetail');
              });
            } else
            if (index == 6) {
              return getTitle('Account Screen', (){
                Navigator.pushNamed(context, '/accountinfo');
              });
            } else if (index == 7) {
              return getTitle('Error Screen', () {
                Navigator.pushNamed(context, '/errorscreen');
              });
            }
              else if(index ==8){
              return getTitle('Signup Screen', () {
                Navigator.pushNamed(context, '/signup');
              });
            } else if(index==9){
              return getTitle('Bottom Bar', () {
                Navigator.pushNamed(context, '/bottombar');
              });
            } else if (index == 10){
              return getTitle('Tour Screen', (){
                Navigator.pushNamed(context, '/login');
              });
            } else if (index == 11){
              return getTitle('Map Screen', (){
                Navigator.pushNamed(context, '/map');
              });
            } else if (index == 12){
              return getTitle('Facebook Login', (){
                Navigator.pushNamed(context, '/facebooklogin');
              });
            }  else if (index == 13){
              return getTitle('hoooray api Login', (){
//                Navigator.pushNamed(context, '/hoorayapi');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ApiScreenTest()));
              });
            }
            else {
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
