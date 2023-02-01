import 'package:flutter/material.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/extensions/darkmode.extension.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    primaryColor: primaryColor,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: contentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
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
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(color: contentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryColor,
      error: errorColor,
      background: backgroundColor,
    ),
  );
}

var appBarTheme = AppBarTheme(
  elevation: 0,
  toolbarHeight: 65,
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    fontWeight: FontWeight.w500,
  ),
);
