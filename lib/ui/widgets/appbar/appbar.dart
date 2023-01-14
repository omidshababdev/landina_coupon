import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:landina_coupon/constants/colors.dart';

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
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: AppBar(
          leadingWidth: 66,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(10, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: Icon(
                  widget.rightIcon,
                  color: primaryColor,
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
                color: primaryColor,
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
                    color: const Color.fromARGB(10, 0, 0, 0),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(
                    widget.leftIcon,
                    color: primaryColor,
                  ),
                  onPressed: widget.leftIconOnPressed,
                  hoverColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
