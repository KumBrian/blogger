import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Color(0xFF376AED);
  static const Color darkGrey = Color(0xFF7B8BB2);
  static const Color darkBlueText = Color(0xFF2D4379);
  static const Color darkBlue = Color(0xFF0D253C);
}

class AppFont {
  static const String fontFamily = 'Avenir';

  static final TextStyle black = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle blackItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle book = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    color: AppColors.darkBlueText,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bookItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle heavy = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle heavyItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle light = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle lightItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle mediumItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle regularItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle roman = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );
}
