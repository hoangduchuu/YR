import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/styles/styles.dart';


class YRTextField extends StatefulWidget {
  final Function(String textValue) onTextChanged;
  final bool isPassword;
  final String hintText;
  final IconData icon;
  YRTextField(
      {Key key,
        @required this.hintText,
        @required this.icon,
        @required this.onTextChanged,@required this.isPassword})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SBTextFieldState();
  }
}

class _SBTextFieldState extends State<YRTextField> {
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
        new Padding(
            padding: EdgeInsets.only(
                bottom: 10, left: 50, right: 50.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: textController,
              obscureText: widget.isPassword==true? _obscureText:false,
              style: TextStyle(fontSize: 17.0,fontFamily: Hfonts.PrimaryFontBold),
              decoration: InputDecoration(

                contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 15, top: 15,right:14),
                fillColor: HColors.textFBGColor,
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 17.0, color: HColors.brighterBlack,fontFamily: Hfonts.PrimaryFontBold),
                border:InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HColors.ColorSecondPrimary,style: BorderStyle.solid,width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                prefixIcon: Icon(
                  widget.icon,
                  color: HColors.ColorSecondPrimary,
                  size: 22.0,
                ),
                suffixIcon: widget.isPassword==true?GestureDetector(
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
                ):null,

              ),
              onChanged: (value) {
                print(_obscureText);
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
