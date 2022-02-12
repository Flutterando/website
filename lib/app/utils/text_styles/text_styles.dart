import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle notoSans(double fontSize, {FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      color: Colors.white,
      fontFamily: 'NotoSans',
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle roboto(double fontSize, {FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
