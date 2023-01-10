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

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      Config.box.write("notifications", notifications);
    });
  }

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
            onTap: () {
              landinaModal(
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: Color(0xffF1F1F1),
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              notifications = !notifications;
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          leading: const AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffF1F1F1),
                              foregroundColor: Color(0xff3B3B3B),
                              child: Icon(CupertinoIcons.rectangle_3_offgrid),
                            ),
                          ),
                          focusColor: const Color(0xfff1f1f1),
                          title: const Text(
                            "فعال کردن اعلان ها",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B3B3B),
                            ),
                          ),
                          subtitle: const Text(
                            "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  notifications = !notifications;
                                  value = notifications;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  context);
            },
            title: "اعلان ها",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(IconlyLight.notification),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/analytics");
            },
            title: "آمار صفحه",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(IconlyLight.activity),
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
            onTap: () {
              Get.toNamed("/about");
            },
            title: "درباره",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(IconlyLight.info_circle),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/language");
            },
            title: "زبان برنامه",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(IconlyLight.paper_negative),
          ),
          LandinaListTile(
            onTap: () {
              landinaModal(
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: Color(0xffF1F1F1),
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              notifications = !notifications;
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          leading: const AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffF1F1F1),
                              foregroundColor: Color(0xff3B3B3B),
                              child: Icon(CupertinoIcons.rectangle_3_offgrid),
                            ),
                          ),
                          focusColor: const Color(0xfff1f1f1),
                          title: const Text(
                            "فعال کردن اعلان ها",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B3B3B),
                            ),
                          ),
                          subtitle: const Text(
                            "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  notifications = !notifications;
                                  value = notifications;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: Color(0xffF1F1F1),
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              notifications = !notifications;
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          leading: const AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffF1F1F1),
                              foregroundColor: Color(0xff3B3B3B),
                              child: Icon(CupertinoIcons.rectangle_3_offgrid),
                            ),
                          ),
                          focusColor: const Color(0xfff1f1f1),
                          title: const Text(
                            "فعال کردن اعلان ها",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B3B3B),
                            ),
                          ),
                          subtitle: const Text(
                            "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  notifications = !notifications;
                                  value = notifications;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: Color(0xffF1F1F1),
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              notifications = !notifications;
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          leading: const AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffF1F1F1),
                              foregroundColor: Color(0xff3B3B3B),
                              child: Icon(CupertinoIcons.rectangle_3_offgrid),
                            ),
                          ),
                          focusColor: const Color(0xfff1f1f1),
                          title: const Text(
                            "فعال کردن اعلان ها",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B3B3B),
                            ),
                          ),
                          subtitle: const Text(
                            "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  notifications = !notifications;
                                  value = notifications;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  context);
            },
            title: "طرح زمینه",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(CupertinoIcons.pencil_outline),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/update");
            },
            title: "بروزرسانی",
            subtitle:
                "از اینجا می تونی هر تغییری رو که میخوای توی حسابت ایجاد کنی.",
            leading: const Icon(CupertinoIcons.app),
          ),
          LandinaListTile(
            onTap: () {
              landinaModal(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const Text(
                          "واقعا میخوای حذفش کنی؟",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 15),
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
                  ),
                  context);
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
