import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/styles.dart';

class YRTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final String titleText;
  final Function(String textValue) onTextChanged;

  YRTextField(
      {Key key,
        @required this.titleText,
      @required this.icon,
      @required this.hintText,
      @required this.onTextChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<YRTextField> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    this.textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: new Text(
                  widget.titleText!=null?widget.titleText:'Tên',
                  style: TextStyle(
                    fontFamily: "oscinebold",
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        new Padding(
          padding: EdgeInsets.only(
               bottom: 20.0, left: 25.0, right: 25.0),
          child: TextField(
            keyboardType: TextInputType.text,
            controller: textController,
            style: TextStyle(fontSize: 16.0, color: textColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                widget.icon,
                color: textColor,
                size: 22.0,
              ),
              hintText: "${widget.hintText}",
              hintStyle: TextStyle(fontSize: 17.0, color: hintTextColor),
            ),
            onChanged: (value) {
              widget.onTextChanged(value);
            },
          )
        ),
      ],
    );
  }
}
