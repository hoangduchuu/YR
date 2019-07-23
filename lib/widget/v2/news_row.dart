import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:your_reward_user/model/Post.dart';
import 'package:your_reward_user/styles/h_colors.dart';

// TODO FIX THIS UI
class NewsRow extends StatelessWidget {
  Post _post;
  final VoidCallback onPressed;

  NewsRow(this._post, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: new Image.network(
                _post.image,
                fit: BoxFit.fill,
                width: 120,
                height: 120,
              ),
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 6,),
                Text(_post.title, style: TextStyle(color: HColors.black, fontSize: 16,
                    fontWeight: FontWeight.w700,),maxLines: 2, overflow: TextOverflow.ellipsis,),
                SizedBox(height: 6,),
                Container(
                  width: 24,
                  height: 3,
                  color: HColors.ColorPrimary,
                ),
                SizedBox(height: 6,),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(_post.content,
                  maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14,),)
                ),
              ],
            ),
          ),
          SizedBox(width: 8,),
        ],
      ),
    );
  }
}
