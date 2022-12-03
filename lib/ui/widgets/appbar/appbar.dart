import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:landina_coupon/main.dart';

class LandinaAppbar extends StatefulWidget {
  String? title;
  IconData? leftIcon;
  VoidCallback? leftIconOnPressed;
  IconData? rightIcon;
  VoidCallback? rightIconOnPressed;

  LandinaAppbar(
      {super.key,
      this.title,
      this.leftIcon,
      this.rightIcon,
      this.leftIconOnPressed,
      this.rightIconOnPressed});

  @override
  State<LandinaAppbar> createState() => _LandinaAppbarState();
}

class _LandinaAppbarState extends State<LandinaAppbar> {
  VoidCallback rebuildOnLocaleChange() => () => setState(() {});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = window.locale;
    PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();
    return AppBar(
      leadingWidth: 66,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(10, 0, 0, 0),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: Icon(
              widget.rightIcon,
              color: const Color.fromARGB(255, 51, 51, 51),
            ),
            onPressed: widget.rightIconOnPressed,
            hoverColor: Colors.transparent,
          ),
        ),
      ),
      title: Text(
        widget.title!,
        style: TextStyle(
          fontFamily: myLocale.languageCode == "en" ? "Poppins" : "Estedad",
          color: const Color.fromARGB(255, 51, 51, 51),
          fontSize: 18,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(10, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: Icon(
                widget.leftIcon,
                color: const Color.fromARGB(255, 51, 51, 51),
              ),
              onPressed: widget.leftIconOnPressed,
              hoverColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
