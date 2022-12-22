import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "تنظیمات",
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {
            landinaModal(
              ButtonBarSuper(
                lineSpacing: 15,
                wrapType: WrapType.balanced,
                wrapFit: WrapFit.divided,
                children: [
                  LandinaTextButton(
                    title: "تنظیمات اپلیکیشن",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  LandinaTextButton(
                    title: "درباره ${AppLocalizations.of(context)!.appName}",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  LandinaTextButton(
                    title: "می خوام از حسابم خارج بشم",
                    backgroundColor: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text("حذف حساب کاربری"),
          onTap: () {},
        )
      ]),
    );
  }
}
