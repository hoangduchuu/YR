import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/styles.dart';

class YRTextField extends StatefulWidget {
  final String hintText;
  final String titleText;
  final Function(String textValue) onTextChanged;
  final bool isPassword;
  YRTextField(
      {Key key,
        @required this.titleText,
      @required this.hintText,
      @required this.onTextChanged,this.isPassword})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<YRTextField> {
  TextEditingController textController;
  bool _obscureText = true;
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
                padding: const EdgeInsets.only(left: 20),
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
            obscureText: _obscureText,
            style: TextStyle(fontSize: 16.0, color: HColors.textColor),
            decoration: InputDecoration(
              border: new UnderlineInputBorder(
                  borderSide: new BorderSide(
                      color: HColors.ColorSecondPrimary
                  )
              ),
              hintStyle: TextStyle(fontSize: 17.0, color: HColors.hintTextColor),
              suffixIcon: widget.isPassword==true?GestureDetector(
                onTap: _toggle,
                child: _obscureText == true
                    ? Icon(
                  FontAwesomeIcons.eyeSlash,
                  size: 18.0,
                  color: Colors.black87,
                )
                    : Icon(
                  FontAwesomeIcons.eye,
                  size: 18.0,
                  color: Colors.black87,
                ),
              ):null,

            ),
            onChanged: (value) {
              widget.onTextChanged(value);
            },
          )
        ),
      ],
    );
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

}
