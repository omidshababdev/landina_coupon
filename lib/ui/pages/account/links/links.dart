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

class LinksPage extends StatefulWidget {
  const LinksPage({super.key});

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "لینک های حساب",
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {
            landinaModal(
              ButtonBarSuper(
                lineSpacing: 15,
                wrapType: WrapType.balanced,
                wrapFit: WrapFit.divided,
                children: [
                  LandinaTextButton(
                    title: "تنظیمات",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  LandinaTextButton(
                    title: "تماس با پشتیبانی",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  LandinaTextButton(
                    title: "اشتراک گذاری پروفایل",
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
    );
  }
}
