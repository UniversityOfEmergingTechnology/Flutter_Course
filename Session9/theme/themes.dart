import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Color(0xffFEFBF6),
    primary: Color(0xff8CB9BD),
    secondary: Color(0xffB67352),
    tertiary: Color(0xffECB159),
    inversePrimary: Color(0xff734642),
  ),
);

const kMainTextStyle = TextStyle(
    color: Color(0xff8CB9BD),
    fontSize: 15,
    letterSpacing: 2
);


ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Color(0xff1E2D4C),
    primary: Color(0xffACBDAA),
    secondary: Color(0xff858585),
    tertiary: Color(0xffCEC0BB),
    inversePrimary: Color(0xff534255)
  ),
);