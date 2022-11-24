import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/widgets/button/text.button.dart';

void filterModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: false,
    builder: (context) {
      return Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "فیلتر مورد نظرت رو انتخاب کن",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "از این قسمت می تونی کوپن ها رو بر اساس فیلتر های زیر فیلتر کنی.",
                  style: TextStyle(
                    fontSize: 13,
                    color: const Color(0xff3B3B3B).withOpacity(0.5),
                    height: 2,
                  ),
                ),
                const SizedBox(height: 30),
                LandinaTextButton(
                  title: "تغییرات فیلتر رو اعمال کن",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
