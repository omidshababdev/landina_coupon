import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/constants/text.styles.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    primaryColor: primaryColor,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.white,
    // backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: contentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: primaryColor,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    primaryColor: primaryColor,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.6),
    iconTheme: IconThemeData(color: contentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: backgroundColor,
    ),
  );
}

var appBarTheme = AppBarTheme(
  elevation: 0,
  toolbarHeight: 65,
  centerTitle: true,
  titleTextStyle: appBarTitle,
);
