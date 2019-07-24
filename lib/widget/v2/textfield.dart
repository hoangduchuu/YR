import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_colors.dart';
import 'package:your_reward_user/styles/h_fonts.dart';

class YRTextField extends StatefulWidget {
  final Function(String textValue) onTextChanged;
  final bool isPassword;
  final String hintText;
  final IconData icon;
  TextEditingController textController;
  TextInputType type = TextInputType.text;
  String defaultText = "";
  String font = "";
  bool showFocusBorder;

  YRTextField(
      {Key key,
      @required this.hintText,
      this.icon,
      @required this.onTextChanged,
      @required this.isPassword,
      this.defaultText,
      this.type,
      this.showFocusBorder = false,
      this.font,
      this.textController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SBTextFieldState();
  }
}

class _SBTextFieldState extends State<YRTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    widget.textController = TextEditingController();
    widget.textController.text = this.widget.defaultText;
    widget.font = Hfonts.PrimaryFontRegular;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Theme(
            data: ThemeData(primaryColor: Colors.black26, accentColor: Colors.orange, hintColor: Colors.black),
            child: TextField(
              keyboardType: this.widget.type,
              controller: widget.textController,
              obscureText: widget.isPassword == true ? _obscureText : false,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, bottom: 15, top: 15, right: 14),
                fillColor: Colors.transparent,
                hintText: widget.hintText,
                labelStyle: new TextStyle(color: Colors.black54),
                hintStyle:
                    TextStyle(fontSize: 17.0, color: HColors.ColorSecondPrimary, fontFamily: Hfonts.LatoMedium),
                border: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.red)),
                focusedBorder: buildOutlineInputBorder(widget.showFocusBorder),
                filled: true,
                prefixIcon: widget.icon != null ? Icon(
                  widget.icon,
                  color: HColors.ColorSecondPrimary,
                  size: 22.0,
                ) : null,
                suffixIcon: widget.isPassword == true
                    ? GestureDetector(
                        onTap: _toggle,
                        child: _obscureText == true
                            ? Icon(
                                FontAwesomeIcons.eyeSlash,
                                size: 15,
                                color: Colors.black87,
                              )
                            : Icon(
                                FontAwesomeIcons.eye,
                                size: 15,
                                color: Colors.black87,
                              ),
                      )
                    : null,
              ),
              onChanged: (value) {
                widget.onTextChanged(value);
              },
            )),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder(bool showFocusBorder) {
    if (showFocusBorder) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: HColors.ColorSecondPrimary, style: BorderStyle.solid, width: 2),
        borderRadius: BorderRadius.circular(10),
      );
    }
    return null;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
