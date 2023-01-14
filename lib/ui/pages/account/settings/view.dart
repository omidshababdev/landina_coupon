import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

  PackageInfo? packageInfo;
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      Config.packageInfo = info;
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
              landinaModal(StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Column(
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
                              value: notifications,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  notifications = !notifications;
                                  notifications = value;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ), context);
            },
            title: "اعلان ها",
            subtitle: "همه اعلان های برنامه رو می تونی از اینجا تنظیم کنی.",
            leading: const Icon(IconlyLight.notification),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/soon");
            },
            title: "آمار صفحه",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.activity),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/soon");
            },
            title: "پروکسی",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(CupertinoIcons.shield),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/soon");
            },
            title: "راهنمایی",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(Ionicons.help),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/about");
            },
            title: "درباره",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.info_circle),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/language");
            },
            title: "زبان حساب",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.paper_negative),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/soon");
            },
            title: "فونت اکانت",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.edit),
          ),
          LandinaListTile(
            onTap: () {
              landinaModal(StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: Config.darkMode != true
                                  ? const Color(0xffF1F1F1)
                                  : const Color(0xffF1F1F1).withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              Config.defaultMode = !Config.defaultMode;
                              if (Config.defaultMode == true) {
                                Get.changeThemeMode(ThemeMode.system);
                                Config.themeStatus("defaultMode");
                                Config.lightMode = false;
                                Config.darkMode = false;
                              }
                              if (Config.lightMode == false &&
                                  Config.darkMode == false) {
                                Config.defaultMode = true;
                              }
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          leading: Config.darkMode != true
                              ? AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.1),
                                    foregroundColor: Colors.black,
                                    child: const Icon(CupertinoIcons.sun_max),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: borderColor,
                                    ),
                                  ),
                                  child: const AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      child: Icon(CupertinoIcons.cube_box),
                                    ),
                                  ),
                                ),
                          focusColor: const Color(0xfff1f1f1),
                          title: const Text(
                            "حالت پیش فرض دستگاه",
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
                              value: Config.defaultMode,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  Config.defaultMode = !Config.defaultMode;
                                  Config.defaultMode = value;
                                  if (Config.defaultMode == true) {
                                    Get.changeThemeMode(ThemeMode.system);
                                    Config.themeStatus("defaultMode");
                                    Config.lightMode = false;
                                    Config.darkMode = false;
                                  }
                                  if (Config.lightMode == false &&
                                      Config.darkMode == false) {
                                    Config.defaultMode = true;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: Config.darkMode != true
                                  ? const Color(0xffF1F1F1)
                                  : const Color(0xffF1F1F1).withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              Config.lightMode = !Config.lightMode;
                              if (Config.lightMode == true) {
                                Get.changeThemeMode(ThemeMode.light);
                                Config.themeStatus("lightMode");
                                Config.defaultMode = false;
                                Config.darkMode = false;
                              }
                              if (Config.defaultMode == false &&
                                  Config.darkMode == false) {
                                Config.lightMode = true;
                              }
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          leading: Config.darkMode != true
                              ? AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.1),
                                    foregroundColor: Colors.black,
                                    child: const Icon(CupertinoIcons.sun_max),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: borderColor,
                                    ),
                                  ),
                                  child: const AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      child: Icon(CupertinoIcons.sun_max),
                                    ),
                                  ),
                                ),
                          focusColor: const Color(0xfff1f1f1),
                          title: const Text(
                            "حالت روز (لایت مود)",
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
                              value: Config.lightMode,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  Config.lightMode = !Config.lightMode;
                                  Config.lightMode = value;

                                  if (Config.lightMode == true) {
                                    Get.changeThemeMode(ThemeMode.light);
                                    Config.themeStatus("lightMode");
                                    Config.defaultMode = false;
                                    Config.darkMode = false;
                                  }
                                  if (Config.defaultMode == false &&
                                      Config.darkMode == false) {
                                    Config.lightMode = true;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: Config.darkMode != true
                                  ? const Color(0xffF1F1F1)
                                  : const Color(0xffF1F1F1).withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              Config.darkMode = !Config.darkMode;
                              if (Config.darkMode == true) {
                                Get.changeThemeMode(ThemeMode.dark);
                                Config.themeStatus("darkMode");
                                Config.defaultMode = false;
                                Config.lightMode = false;
                              }
                              if (Config.defaultMode == false &&
                                  Config.lightMode == false) {
                                Config.darkMode = true;
                              }
                            });
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          leading: Config.darkMode != true
                              ? AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.1),
                                    foregroundColor: Colors.black,
                                    child: const Icon(CupertinoIcons.sun_max),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: borderColor,
                                    ),
                                  ),
                                  child: const AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      child: Icon(CupertinoIcons.moon),
                                    ),
                                  ),
                                ),
                          focusColor: const Color(0xfff1f1f1),
                          title: const Text(
                            "حالت شب (دارک مود)",
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
                              value: Config.darkMode,
                              activeColor: const Color(0xff3B3B3B),
                              onChanged: (value) => setState(
                                () {
                                  Config.darkMode = !Config.darkMode;
                                  Config.darkMode = value;
                                  if (Config.darkMode == true) {
                                    Get.changeThemeMode(ThemeMode.dark);
                                    Config.themeStatus("darkMode");
                                    Config.defaultMode = false;
                                    Config.lightMode = false;
                                  }
                                  if (Config.defaultMode == false &&
                                      Config.lightMode == false) {
                                    Config.darkMode = true;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ), context);
            },
            title: "طرح زمینه",
            subtitle:
                "از این قسمت می تونی تم برنامه رو برای دید بهتر در شب و روز تنظیم کنی.",
            leading: const Icon(CupertinoIcons.pencil_outline),
          ),
          LandinaListTile(
            onTap: () {
              Get.toNamed("/soon");
            },
            title: "بروزرسانی",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(CupertinoIcons.app),
          ),
          LandinaListTile(
            onTap: () {
              landinaModal(StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Container(
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
                  );
                },
              ), context);
            },
            title: "حذف حساب کاربری",
            subtitle:
                "اگه دیگه این اکانت بدردت نمی خوره می تونی از اینجا حذفش کنی",
            leading: const Icon(IconlyLight.delete),
          ),
        ],
      ),
    );
  }
}
