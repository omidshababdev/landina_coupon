import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    primaryColor: !context.isDarkMode ? Colors.black : Colors.white,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: contentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: !context.isDarkMode ? Colors.black : Colors.white,
      error: errorColor,
      background: !context.isDarkMode ? Colors.black : Colors.white,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    primaryColor: !context.isDarkMode ? Colors.black : Colors.white,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(color: contentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: !context.isDarkMode ? Colors.black : Colors.white,
      error: errorColor,
      background: !context.isDarkMode ? Colors.black : Colors.white,
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
