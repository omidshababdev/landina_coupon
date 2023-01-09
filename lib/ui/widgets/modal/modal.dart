import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

Future landinaModal(Widget child) {
  return Get.bottomSheet(
    StatefulBuilder(
      builder: (context, setState) {
        return Wrap(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: SmoothBorderRadius.only(
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
                      color: const Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(height: 15),
                  child,
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
}
