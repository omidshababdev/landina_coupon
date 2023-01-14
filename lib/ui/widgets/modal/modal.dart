import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:landina_coupon/constants/colors.dart';

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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          decoration: BoxDecoration(
            color: SchedulerBinding.instance.window.platformBrightness !=
                    ThemeMode.light
                ? const Color(0xff0F172A)
                : const Color(0xFFF1F1F1),
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
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 15),
              widget.child,
            ],
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
