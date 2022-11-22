import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/button/button.dart';
import 'package:landina_coupon/ui/components/modals/login.modal.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "ورود به حساب کاربری",
          rightIcon: IconlyLight.call,
          rightIconOnPressed: () {},
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LandinaTextField(
                hintText: "ایمیل و یا نام کاربری",
                suffixIcon: IconlyLight.info_circle,
                suffixIconOnPressed: () {},
                prefixIcon: IconlyLight.user,
                prefixIconOnPressed: () {},
              ),
              LandinaTextField(
                hintText: "رمز عبور",
                suffixIcon: IconlyLight.show,
                suffixIconOnPressed: () {
                  loginModal(context);
                },
                prefixIcon: IconlyLight.password,
                prefixIconOnPressed: () {},
              ),
              LandinaButton(
                title: "ورود به برنامه",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
