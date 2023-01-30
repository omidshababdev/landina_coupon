import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/widgets/listtile/switch.listtile.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool bySystemLang = true;
  bool autoTranslate = false;
  List<bool> langs = [true, false];
  Locale myLocale = window.locale;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: LandinaAppbar(
              title: 'زبان حساب',
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
              LandinaSwitchListTile(
                onTap: () {
                  setState(() {
                    bySystemLang = !bySystemLang;
                  });
                },
                leading: context.isDarkMode != true
                    ? AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.1),
                            foregroundColor: Colors.black,
                            child: const Icon(Ionicons.language)),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: context.isDarkMode != true
                                ? const Color(0xffF1F1F1).withOpacity(0.5)
                                : const Color(0xffF1F1F1).withOpacity(0.1),
                          ),
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1 / 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            child: Icon(Ionicons.language),
                          ),
                        ),
                      ),
                title: "بر اساس زبان دستگاه",
                subtitle:
                    "با کلیک روی این قسمت پروکسی فعال و یا غیرفعال می شود.",
                active: bySystemLang,
                onChanged: (value) {
                  setState(
                    () {
                      bySystemLang = !bySystemLang;
                      bySystemLang = value;
                    },
                  );
                },
              ),
              LandinaSwitchListTile(
                onTap: () {
                  setState(() {
                    autoTranslate = !autoTranslate;
                  });
                },
                leading: context.isDarkMode != true
                    ? AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          foregroundColor: Colors.black,
                          child: const Text(
                            "Auto",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: context.isDarkMode != true
                                ? const Color(0xffF1F1F1).withOpacity(0.5)
                                : const Color(0xffF1F1F1).withOpacity(0.1),
                          ),
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1 / 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            child: Text(
                              "Auto",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                title: "ترجمه خودکار",
                subtitle:
                    "با کلیک روی این قسمت پروکسی فعال و یا غیرفعال می شود.",
                active: autoTranslate,
                onChanged: (value) {
                  setState(
                    () {
                      autoTranslate = !autoTranslate;
                      autoTranslate = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              LandinaSwitchListTile(
                onTap: () {
                  setState(() {
                    langs[0] = !langs[0];
                    Get.updateLocale(const Locale("en"));
                  });
                },
                leading: context.isDarkMode != true
                    ? AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          foregroundColor: Colors.black,
                          child: const Text(
                            "EN",
                            style: TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: context.isDarkMode != true
                                ? const Color(0xffF1F1F1).withOpacity(0.5)
                                : const Color(0xffF1F1F1).withOpacity(0.1),
                          ),
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1 / 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            child: Text(
                              "EN",
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                      ),
                title: "انگلیسی",
                subtitle: "English",
                subtitleFont: "Poppins",
                active: langs[0],
                onChanged: (value) {
                  bySystemLang = !bySystemLang;
                  bySystemLang = value;
                  setState(() {
                    langs[0] = !langs[0];
                    Get.updateLocale(const Locale("en"));
                  });
                },
              ),
              LandinaSwitchListTile(
                onTap: () {
                  setState(() {
                    langs[1] = !langs[1];
                    Get.updateLocale(const Locale("fa"));
                  });
                },
                leading: context.isDarkMode != true
                    ? AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          foregroundColor: Colors.black,
                          child: const Text(
                            "FA",
                            style: TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: context.isDarkMode != true
                                ? const Color(0xffF1F1F1).withOpacity(0.5)
                                : const Color(0xffF1F1F1).withOpacity(0.1),
                          ),
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1 / 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            child: Text(
                              "FA",
                              style: TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                      ),
                title: "فارسی",
                subtitle: "Persian",
                subtitleFont: "Poppins",
                active: langs[1],
                onChanged: (value) {
                  bySystemLang = !bySystemLang;
                  bySystemLang = value;
                  setState(() {
                    langs[1] = !langs[1];
                    Get.updateLocale(const Locale("fa"));
                  });
                },
              ),
            ],
          )),
    );
  }
}
