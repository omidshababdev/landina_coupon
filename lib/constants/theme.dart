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
  backgroundColor:
      SchedulerBinding.instance.window.platformBrightness == ThemeMode.light
          ? const Color(0xff0F172A).withOpacity(0.1)
          : const Color(0xFFFFFFFF).withOpacity(0.1),
  titleTextStyle: appBarTitle,
);
