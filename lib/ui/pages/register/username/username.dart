import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/components/modals/about.modal.dart';
import 'package:landina_coupon/ui/components/modals/login.modal.dart';
import 'package:landina_coupon/ui/pages/register/email/email.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/button/button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "نام کاربری",
          rightIcon: IconlyLight.info_circle,
          rightIconOnPressed: () {
            aboutModal(context);
          },
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 325,
          constraints: const BoxConstraints(
            maxWidth: 325,
            minWidth: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  "لطفا برای شروع ثبت نام برای خود یک نام کاربری وارد کنید.",
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: LandinaTextField(
                  hintText: "نام کاربری",
                  suffixIcon: IconlyLight.info_circle,
                  suffixIconOnPressed: () {
                    loginModal(context);
                  },
                  prefixIcon: IconlyLight.user,
                  prefixIconOnPressed: () {},
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: LandinaButton(
                  title: "برو مرحله بعد",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EmailPage();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
