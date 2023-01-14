import 'package:flutter/material.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: contentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: primaryColorDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: contentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: contentColorLightTheme.withOpacity(0.32),
      // selectedIconTheme:  IconThemeData(color: primaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Config.rightAlignLangs.contains(Config.myLocale.languageCode)
        ? "Estedad"
        : "Poppins",
    primaryColor: primaryColorDark,
    backgroundColor: backgroundColorDark,
    scaffoldBackgroundColor: contentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: contentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
      error: errorColorDark,
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
    color: primaryColor,
  ),
);
