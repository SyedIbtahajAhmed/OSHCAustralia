import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstants {
  // Material Color
  static Map<int, Color> appThemeBlueColorCodes = {
    50: Color.fromRGBO(67, 150, 192, .1),
    100: Color.fromRGBO(67, 150, 192, .2),
    200: Color.fromRGBO(67, 150, 192, .3),
    300: Color.fromRGBO(67, 150, 192, .4),
    400: Color.fromRGBO(67, 150, 192, .5),
    500: Color.fromRGBO(67, 150, 192, .6),
    600: Color.fromRGBO(67, 150, 192, .7),
    700: Color.fromRGBO(67, 150, 192, .8),
    800: Color.fromRGBO(67, 150, 192, .9),
    900: Color.fromRGBO(67, 150, 192, 1),
  };

  // Colors
  static Color appLightBlueColor = const Color(0xFFf5fafe);
  static Color appBlueColor = const Color(0xFF4396c0);
  static Color appDarkBlueColor = const Color(0xFF007acc);
  static Color appBlackColor = const Color(0xFF000000);
  static Color appGreyTextColor = const Color(0xFF262626);
  static Color appWhiteColor = const Color(0xFFFFFFFF);
  static Color appGreenColor = const Color(0xFF28a745);
  static Color appYellowColor = const Color(0xFFffd400);

  // Font Sizes
  static double appFontSizeh1 = 10.0;
  static double appFontSizeh2 = 12.0;
  static double appFontSizeh3 = 15.0;
  static double appFontSizeh4 = 18.0;
  static double appFontSizeh5 = 20.0;
  static double appFontSizeh6 = 22.0;
  static double appFontSizeh7 = 25.0;
  static double appFontSizeh8 = 28.0;
  static double appFontSizeh9 = 30.0;
  static double appFontSizeh10 = 32.0;
  static double appFontSizeh11 = 35.0;
  static double appFontSizeh12 = 38.0;
  static double appFontSizeh13 = 40.0;

  // Paddings
  static double appPaddingLarge = 20.0;
  static double appPaddingMedium = 15.0;
  static double appPaddingSmall = 10.0;
  static double appPaddingExtraSmall = 8.0;

  // Bread Crumbs
  static List<String> appBreadCrumbs = [
    'Select Provider',
    'Provider Details',
    'Secure Payment',
    'Receive Certificate by Email',
  ];
}
