import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/components/modals/about.modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/components/modals/login.modal.dart';
import 'package:landina_coupon/ui/widgets/listtile/listtile.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "حساب کاربری",
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
      body: ListView(
        key: const PageStorageKey<String>('profile'),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: LandinaTextField(
              hintText: "تنظیمات حساب",
              prefixIcon: IconlyLight.search,
              prefixIconOnPressed: () {},
              suffixIcon: IconlyLight.arrow_left_2,
              enabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
