import 'package:explorer/core/style/colors.dart';
import 'package:flutter/material.dart';

class AppFontsManager {
  static const String mainFontName = 'Open-Sans';

  static TextStyle boldTextStyle({double? fontSize, Color? color}) =>
      _baseTextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w700,
      );
  static TextStyle semiBoldTextStyle({double? fontSize, Color? color}) =>
      _baseTextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
      );
  static TextStyle regularTextStyle({double? fontSize, Color? color}) =>
      _baseTextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
      );
  static TextStyle thinTextStyle({double? fontSize, Color? color}) =>
      _baseTextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w400,
      );

  static TextStyle _baseTextStyle({
    double? fontSize,
    Color? color,
    String fontFamily = mainFontName,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColorsManager.mainFontColor,
        fontFamily: fontFamily,
      );
}
