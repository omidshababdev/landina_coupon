import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/pages/login/login.dart';
import 'package:landina_coupon/ui/pages/register/username/username.dart';
import 'package:landina_coupon/ui/widgets/button/button.dart';

void aboutModal(BuildContext context) {
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
                  title: "تماس با تیم لندینا",
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UsernamePage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                LandinaButton(
                  title: "ورود به حساب کاربری",
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
