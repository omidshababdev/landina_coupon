import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/components/categories/categories.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

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
                Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: [
                    ...List.generate(
                      6,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffF1F1F1),
                          ),
                        ),
                        child: Text(
                          "جدیدترین ها",
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
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
