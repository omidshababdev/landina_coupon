import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

void ModalContext(BuildContext context, child) {
  Widget child;
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
                  "کوپن کپی شد!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "حالا می تونی با جایگذاری در محل مناسب ازش استفاده کنی.",
                  style: TextStyle(
                    fontSize: 13,
                    color: const Color(0xff3B3B3B).withOpacity(0.5),
                    height: 2,
                  ),
                ),
                const SizedBox(height: 30),
                LandinaTextButton(
                  title: "ثبت نظر",
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
