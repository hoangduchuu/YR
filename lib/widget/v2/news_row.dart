import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:your_reward_user/model/Post.dart';

// TODO FIX THIS UI
class NewsRow extends StatelessWidget {
  Post _post;
  final VoidCallback onPressed;

  NewsRow(this._post, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.all(5),
          elevation: 1.0,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                height: 150,
                width: 120,
                child: Image.network(
                  _post.image,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    height: 150,
                    child: Html(
                      data: _post.content,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
