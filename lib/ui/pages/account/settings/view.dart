import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/listtile.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:get/get.dart';

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
          rightIconOnPressed: () {},
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        children: [
          LandinaListTile(
            onTap: () {},
            title: "اعلان ها",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(IconlyLight.notification),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/proxy");
            },
            title: "پروکسی",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(CupertinoIcons.shield),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/help");
            },
            title: "راهنمایی",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(Ionicons.help),
          ),
          LandinaListTile(
            onTap: () {},
            title: "درباره",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(IconlyLight.info_circle),
          ),
          LandinaListTile(
            onTap: () {},
            title: "زبان برنامه",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(CupertinoIcons.layers),
          ),
          LandinaListTile(
            onTap: () {
              landinaModal(Container());
            },
            title: "طرح زمینه",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(CupertinoIcons.pencil_outline),
          ),
          LandinaListTile(
            onTap: () {
              landinaModal(Container());
            },
            title: "بروزرسانی",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(CupertinoIcons.app),
          ),
          LandinaListTile(
            onTap: () {
              landinaModal(
                Column(
                  children: [
                    const Text(
                      "واقعا میخوای حذفش کنی؟",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonBarSuper(
                      lineSpacing: 15,
                      wrapType: WrapType.balanced,
                      wrapFit: WrapFit.proportional,
                      children: [
                        LandinaTextButton(
                          title: "حذفش کن",
                          backgroundColor: true,
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            await Config.client.deleteUser(
                              Config.box.read("myId"),
                            );
                          },
                        ),
                        LandinaTextButton(
                          title: "نه نمی خواد",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            title: "حذف حساب کاربری",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(IconlyLight.delete),
          ),
        ],
      ),
    );
  }
}
