import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

void landinaModal(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    ),
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 40,
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
          minHeight: 100,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: SmoothBorderRadius.only(
            topLeft: SmoothRadius(
              cornerRadius: 30,
              cornerSmoothing: 1,
            ),
            topRight: SmoothRadius(
              cornerRadius: 30,
              cornerSmoothing: 1,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: const Text(
            "از اینجا می تونی فیلتر مورد نظرت رو اعمال کنی",
          ),
        ),
      );
    },
  );
}
