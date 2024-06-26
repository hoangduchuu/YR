import 'package:flutter/material.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class CommonButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double radiusValue;
  final double width;
  final Widget icon;
  final String text;
  final double buttonPadding;
  final String font;
  final double textSize;

  CommonButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.buttonPadding,
    this.radiusValue,
    this.width,
    this.font,
    this.icon,
    this.textSize,
  }) : super(key: key);

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                padding: widget.buttonPadding != null ? EdgeInsets.all(widget.buttonPadding) : EdgeInsets.all(11),
                textColor: widget.textColor == null ? Colors.white : widget.textColor,
                color: widget.backgroundColor == null ? Color(0xFF3b5998) : widget.backgroundColor,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(widget.radiusValue == null ? 300 : widget.radiusValue)),
                onPressed: widget.onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    widget.icon != null ? widget.icon : SizedBox.shrink(),
                    widget.icon != null
                        ? SizedBox(
                            width: 8,
                          )
                        : SizedBox.shrink(),
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: widget.textSize ?? 16,
                          fontFamily: 'Lato', fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
