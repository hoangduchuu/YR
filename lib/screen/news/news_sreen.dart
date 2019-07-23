import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:your_reward_user/model/Post.dart';
import 'package:your_reward_user/styles/styles.dart';

class NewsScreen extends StatelessWidget {
  String url;
  Post post;

  NewsScreen({this.post, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'CHI TIẾT',
          style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
        ),
      ),
      backgroundColor: HColors.bgColor,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: HtmlWidget(
            post.content,
            onTapUrl: (url) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('onTapUrl'),
                content: Text(url),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
