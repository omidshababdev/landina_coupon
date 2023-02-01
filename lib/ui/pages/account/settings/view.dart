import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/ui/widgets/listtile/switch.listtile.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/simple.listtile.dart';
import 'package:landina_coupon/ui/widgets/modals/simple.modal.dart';
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
  bool notifications = Config.isNotifAllowed();

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
          LandinaSimpleListTile(
            onTap: () {
              landinaModal(
                StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return Column(
                      children: [
                        LandinaSwitchListTile(
                          onTap: () {
                            setState(() {
                              notifications = !notifications;

                              Config.setNotifAllowed(notifications);
                              print(Config.isNotifAllowed());
                            });
                          },
                          leading: !context.isDarkMode
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      foregroundColor: Colors.black,
                                      child: const Icon(
                                          CupertinoIcons.rectangle_3_offgrid),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.1),
                                    ),
                                  ),
                                  child: const AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      child: Icon(
                                          CupertinoIcons.rectangle_3_offgrid),
                                    ),
                                  ),
                                ),
                          title: "همه اعلان ها",
                          subtitle:
                              "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                          active: notifications,
                          onChanged: (value) {
                            setState(
                              () {
                                notifications = !notifications;
                                notifications = value;

                                Config.setNotifAllowed(notifications);
                                print(Config.isNotifAllowed());
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                context,
              );
            },
            title: "اعلان ها",
            subtitle: "همه اعلان های برنامه رو می تونی از اینجا تنظیم کنی.",
            leading: const Icon(IconlyLight.notification),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/analytics");
            },
            title: "آمار صفحه",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.activity),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/auth");
            },
            title: "احراز هویت",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(Ionicons.finger_print_outline),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/security");
            },
            title: "امنیت حساب",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.lock),
          ),
          // LandinaSimpleListTile(
          //   onTap: () {
          //     Get.toNamed("/proxy");
          //   },
          //   title: "پروکسی",
          //   subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
          //   leading: const Icon(CupertinoIcons.shield),
          // ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/ads");
            },
            title: "تبلیغات",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.paper),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/help");
            },
            title: "راهنمایی",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(Ionicons.help),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/about");
            },
            title: "درباره لندینا",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.info_circle),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/language");
            },
            title: "زبان اپلیکیشن",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.paper_negative),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/fonts");
            },
            title: "فونت اپلیکیشن",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(IconlyLight.edit),
          ),
          LandinaSimpleListTile(
            onTap: () {
              landinaModal(
                StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return Column(
                      children: [
                        LandinaSwitchListTile(
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
                          leading: !context.isDarkMode
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      foregroundColor: Colors.black,
                                      child:
                                          const Icon(CupertinoIcons.cube_box),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.1),
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
                          title: "حالت پیش فرض دستگاه",
                          subtitle:
                              "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                          active: Config.defaultMode,
                          onChanged: (value) {
                            setState(
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
                            );
                          },
                        ),
                        LandinaSwitchListTile(
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
                          leading: !context.isDarkMode
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      foregroundColor: Colors.black,
                                      child: const Icon(CupertinoIcons.sun_max),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.1),
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
                          title: "حالت روز (لایت مود)",
                          subtitle:
                              "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                          active: Config.lightMode,
                          onChanged: (value) {
                            setState(
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
                            );
                          },
                        ),
                        LandinaSwitchListTile(
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
                          leading: !context.isDarkMode
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      foregroundColor: Colors.black,
                                      child: const Icon(CupertinoIcons.moon),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.1),
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
                          title: "حالت شب (دارک مود)",
                          subtitle:
                              "در این قسمت می توانید همه نوتیفیکیشن های برنامه را غیرفعال کنید.",
                          active: Config.darkMode,
                          onChanged: (value) {
                            setState(
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
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                context,
              );
            },
            title: "طرح زمینه",
            subtitle:
                "از این قسمت می تونی تم برنامه رو برای دید بهتر در شب و روز تنظیم کنی.",
            leading: const Icon(CupertinoIcons.pencil_outline),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/update");
            },
            title: "بروزرسانی",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(CupertinoIcons.app),
          ),
          LandinaSimpleListTile(
            onTap: () {
              Get.toNamed("/backup");
            },
            title: "بک آپ اطلاعات",
            subtitle: "بهت قول میدیم بزودی این صفحه رو میسازیم ...",
            leading: const Icon(CupertinoIcons.cloud_upload),
          ),
          LandinaSimpleListTile(
            onTap: () {
              landinaModal(
                StatefulBuilder(
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
                ),
                context,
              );
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
