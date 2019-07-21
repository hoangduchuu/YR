import 'package:flutter/material.dart';
import 'package:your_reward_user/entity/enums.dart';
import 'package:your_reward_user/styles/h_fonts.dart';
import 'package:your_reward_user/utils/CommonUtils.dart';

class YRText extends StatelessWidget {
  String text;
  TextStyle style;
  Color color, backgroundColor;
  String font = Hfonts.DefaultFont;
  TextFontStyle textFontStyle = TextFontStyle.REGULAR;
  double fontSize;

  YRText(
    this.text, {
    this.style,
    this.color,
    this.backgroundColor,
    this.font,
    this.textFontStyle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: mergStyle(style),
    );
  }

  // merge style if needed
  TextStyle mergStyle(TextStyle style) {
    if (style == null) {
      return getDefaultStyleDependOnFontStyle();
    } else {
      TextStyle defaultTextStyle = getDefaultStyleDependOnFontStyle();
      TextStyle effectedTextStyle = style;
      if (style != null) {
        effectedTextStyle.merge(defaultTextStyle);
      }
      return effectedTextStyle;
    }
  }

  // TODO: define default style for all text here
  TextStyle getDefaultStyleDependOnFontStyle() {
    if (textFontStyle == TextFontStyle.BOLD) {
      return TextStyle(
          color: color,
          fontSize: fontSize == null ? 16 : fontSize,
          fontFamily: CommonUtils.getFontName(Hfonts.PrimaryFontBold),
          backgroundColor: backgroundColor);
    }
    return TextStyle(
        color: color,
        fontSize: fontSize == null ? 16 : fontSize,
        fontFamily: CommonUtils.getFontName(font),
        backgroundColor: backgroundColor);

    // defind underline / italic if needed
  }
}
