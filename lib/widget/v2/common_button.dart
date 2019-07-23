import 'package:flutter/material.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class CommonButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double radiusValue;
  final double width;
  final Icon icon;
  final String text;
  final double buttonPadding;
  String font;
  final double textSize;
  bool isRoundedButon;
  final Color roundedColor;
  double paddingLeft, paddingTop, paddingRight, paddingBottom;

  CommonButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      @required this.backgroundColor,
      @required this.textColor,
      @required this.buttonPadding,
      this.radiusValue,
      this.width,
      this.font = Hfonts.LatoSemiBold,
      this.isRoundedButon = false,
      this.icon,
      this.paddingBottom = 0,
      this.paddingTop = 0,
      this.paddingRight = 0,
      this.paddingLeft = 0,
      this.textSize,
      this.roundedColor = Colors.red})
      : super(key: key);

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: widget.width != null ? widget.width : 270,
          height: 75,
          child: Column(
            children: <Widget>[
              switchButton(),
            ],
          )),
    );
  }

  Widget switchButton() {
    if (widget.isRoundedButon) {
      return OutlineButton(
        padding: EdgeInsets.only(
            left: widget.paddingLeft, right: widget.paddingRight, bottom: widget.paddingBottom, top: widget.paddingTop),
        child: Text(
          widget.text == null ? 'Hey dev, please insert text value. Thanks' : widget.text,
          style: TextStyle(
              color: widget.textColor == null ? Colors.white : widget.textColor,
              fontSize: widget.textSize == null ? 16 : widget.textSize,
              fontFamily: CommonUtils.getFontName(widget.font)),
        ),
        onPressed: widget.onPressed,
        //callback when button is clicked
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        borderSide: BorderSide(
          color: widget.roundedColor, //Color of the border
          style: BorderStyle.solid, //Style of the border
          width: widget.radiusValue, //width of the border
        ),
      );
    }
    return FlatButton(
      padding: widget.buttonPadding != null ? EdgeInsets.all(widget.buttonPadding) : EdgeInsets.all(11),
      textColor: widget.textColor == null ? Colors.white : widget.textColor,
      color: widget.backgroundColor == null ? Color(0xFF3b5998) : widget.backgroundColor,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(widget.radiusValue == null ? 20 : widget.radiusValue)),
      onPressed: widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.icon != null ? widget.icon : SizedBox.shrink(),
          widget.icon != null
              ? SizedBox(
                  width: 15,
                )
              : SizedBox.shrink(),
          Text(
            widget.text == null ? 'Hey dev, please insert text value. Thanks' : widget.text,
            style: TextStyle(
                fontSize: widget.textSize == null ? 16 : widget.textSize,
                fontFamily: CommonUtils.getFontName(widget.font)),
          )
        ],
      ),
    );
  }
}
