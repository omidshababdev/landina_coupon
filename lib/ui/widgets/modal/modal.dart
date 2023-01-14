import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';

class LandinaBottomSheet extends StatefulWidget {
  Widget child;
  LandinaBottomSheet({super.key, required this.child});

  @override
  State<LandinaBottomSheet> createState() => _LandinaBottomSheetState();
}

class _LandinaBottomSheetState extends State<LandinaBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                decoration: BoxDecoration(
                  color: Config.darkMode == true
                      ? Colors.black.withOpacity(0.6)
                      : Colors.white.withOpacity(0.6),
                  borderRadius: const SmoothBorderRadius.only(
                    topLeft: SmoothRadius(
                      cornerRadius: 30,
                      cornerSmoothing: 2,
                    ),
                    topRight: SmoothRadius(
                      cornerRadius: 30,
                      cornerSmoothing: 2,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Config.darkMode != true
                            ? Colors.black.withOpacity(0.1)
                            : const Color(0xffF1F1F1).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(height: 15),
                    widget.child,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

landinaModal(Widget child, BuildContext context) async {
  return showModalBottomSheet(
    elevation: 0,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return LandinaBottomSheet(child: child);
        },
      );
    },
  );
}
