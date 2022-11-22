import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/pages/login/login.dart';
import 'package:landina_coupon/ui/widgets/button/button.dart';

void loginModal(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    ),
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: false,
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 40,
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.25,
          minHeight: 50,
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
          child: Column(
            children: [
              LandinaButton(
                title: "باز کردن حساب جدید",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              LandinaButton(
                title: "ورود به حساب",
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
      );
    },
  );
}
