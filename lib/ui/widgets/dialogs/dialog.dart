import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

LandinaDialog(
  String title,
  String primaryButtonTitle,
  String secondaryButtonTitle,
  VoidCallback primaryButtonOnPressed,
  VoidCallback secondaryButtonOnPressed,
) async {
  return Get.dialog(
    AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Wrap(
            children: [
              ClipRRect(
                borderRadius: const SmoothBorderRadius.all(
                  SmoothRadius(
                    cornerRadius: 30,
                    cornerSmoothing: 2,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ButtonBarSuper(
                          lineSpacing: 15,
                          wrapType: WrapType.balanced,
                          wrapFit: WrapFit.proportional,
                          children: [
                            LandinaTextButton(
                              title: primaryButtonTitle,
                              backgroundColor: true,
                              onPressed: primaryButtonOnPressed,
                            ),
                            LandinaTextButton(
                              title: secondaryButtonTitle,
                              onPressed: secondaryButtonOnPressed,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
