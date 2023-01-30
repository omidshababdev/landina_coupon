import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';

class LandinaAppbar extends StatefulWidget {
  String? title;
  VoidCallback? titleOnTap;
  IconData? leftIcon;
  VoidCallback? leftIconOnPressed;
  IconData? rightIcon;
  VoidCallback? rightIconOnPressed;

  LandinaAppbar(
      {super.key,
      this.title,
      this.titleOnTap,
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
    PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: context.isDarkMode != true
                    ? const Color(0xffF1F1F1).withOpacity(0.5)
                    : const Color(0xffF1F1F1).withOpacity(0.1),
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: context.isDarkMode != true
                ? Colors.white.withOpacity(0.6)
                : Colors.black.withOpacity(0.6),
            leadingWidth: 66,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: context.isDarkMode != true
                        ? const Color(0xffF1F1F1).withOpacity(0.5)
                        : const Color(0xffF1F1F1).withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(
                    widget.rightIcon,
                    color: secondaryColor,
                  ),
                  onPressed: widget.rightIconOnPressed,
                  // hoverColor: Colors.transparent,
                ),
              ),
            ),
            title: GestureDetector(
              onTap: widget.titleOnTap,
              child: Text(
                widget.title!,
                style: TextStyle(
                  fontSize: 18,
                  color: secondaryColor,
                ),
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
                      color: context.isDarkMode != true
                          ? const Color(0xffF1F1F1).withOpacity(0.5)
                          : const Color(0xffF1F1F1).withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: Icon(
                      widget.leftIcon,
                      color: secondaryColor,
                    ),
                    onPressed: widget.leftIconOnPressed,
                    hoverColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
