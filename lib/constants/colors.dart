import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var primaryColor =
    SchedulerBinding.instance.window.platformBrightness == ThemeMode.light
        ? const Color(0xFFF1F1F1)
        : const Color(0xff0F172A);
var backgroundColor =
    SchedulerBinding.instance.window.platformBrightness != ThemeMode.light
        ? const Color(0xff0F172A)
        : const Color(0xFFF1F1F1);
var secondaryColor =
    SchedulerBinding.instance.window.platformBrightness != ThemeMode.light
        ? const Color(0xff0F172A)
        : const Color(0xFFFFFFFF);
var borderColor = const Color.fromARGB(10, 0, 0, 0);
var contentColorLightTheme = const Color(0xFF3B3B3B);
var contentColorDarkTheme = const Color(0xFFF5FCF9);
var warninngColor = const Color(0xFFF3BB1C);
var errorColor = const Color(0xFFF03738);
