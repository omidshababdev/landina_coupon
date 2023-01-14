import 'package:flutter/material.dart';
import 'package:landina_coupon/constants/config.dart';

var primaryColor =
    Config.darkMode == true ? const Color(0xFFF1F1F1) : Colors.black;
var backgroundColor =
    Config.darkMode == true ? Colors.black : const Color(0xFFF1F1F1);
var secondaryColor =
    Config.darkMode != true ? Colors.black : const Color(0xFFFFFFFF);
var borderColor = Config.darkMode != true
    ? const Color(0xffF1F1F1).withOpacity(0.5)
    : const Color(0xffF1F1F1).withOpacity(0.1);
var contentColorLightTheme = const Color(0xFF3B3B3B);
var contentColorDarkTheme = const Color(0xFFF5FCF9);
var warninngColor = const Color(0xFFF3BB1C);
var errorColor = const Color(0xFFF03738);
