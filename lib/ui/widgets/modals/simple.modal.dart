import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandinaBottomSheet extends StatefulWidget {
  Widget child;
  LandinaBottomSheet({super.key, required this.child});

  @override
  State<LandinaBottomSheet> createState() => _LandinaBottomSheetState();
}

class _LandinaBottomSheetState extends State<LandinaBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ClipRRect(
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
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              decoration: BoxDecoration(
                color: !context.isDarkMode
                    ? Colors.white
                    : Colors.black.withOpacity(0.6),
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.15),
                    spreadRadius: 30,
                    blurRadius: 15,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: !context.isDarkMode
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
          ),
        ),
      ],
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
