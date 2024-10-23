import 'package:explorer/core/style/colors.dart';
import 'package:explorer/core/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeHandler {
  static ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      primaryColor: AppColorsManager.primaryColor,
      scaffoldBackgroundColor: const Color.fromARGB(255, 249, 249, 249),
      fontFamily: AppFontsManager.mainFontName,
    );
  }
}
