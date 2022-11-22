import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/pages/login/login.dart';
import 'package:landina_coupon/ui/widgets/button/button.dart';

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
              children: [
                LandinaButton(
                  title: "اعمال فیلتر",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 15),
                LandinaButton(
                  title: "نادیده گرفتن فیلتر",
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
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
