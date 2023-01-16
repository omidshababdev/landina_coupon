import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/components/categories/categories.box.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/category/category.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: AppLocalizations.of(context)!.categories.capitalize(),
          rightIcon: IconlyLight.category,
          rightIconOnPressed: () {},
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        key: const PageStorageKey<String>('profile'),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        children: [
          SingleChildScrollView(
            key: const PageStorageKey<String>('categories'),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Wrap(
              spacing: 8,
              children: [
                ...List.generate(
                  6,
                  (index) => const Category(
                    title: "جدیدترین ها",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          CategoriesBox(),
        ],
      ),
    );
  }
}
