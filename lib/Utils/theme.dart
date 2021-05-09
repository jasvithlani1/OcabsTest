import 'package:flutter/material.dart';
import 'package:ocabstest/Utils/colors.dart';
import 'package:ocabstest/Utils/utils.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: primaryColor,
    accentColor: primaryColorDark,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AvailableFonts.primaryFont,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 22.0,
      ),
      bodyText2: TextStyle(
        fontSize: 18.0,
      ),
    ),
  );
}
