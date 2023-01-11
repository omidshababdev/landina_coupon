import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';

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
                      bySystemLang = !bySystemLang;
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Icon(Ionicons.language),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "بر اساس زبان دستگاه",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "با کلیک روی این قسمت پروکسی فعال و یا غیرفعال می شود.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: bySystemLang,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          bySystemLang = !bySystemLang;
                          bySystemLang = value;
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
                      autoTranslate = !autoTranslate;
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "Auto",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "ترجمه خودکار",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "با کلیک روی این قسمت پروکسی فعال و یا غیرفعال می شود.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: autoTranslate,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          autoTranslate = !autoTranslate;
                          autoTranslate = value;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
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
                      langs[0] = !langs[0];
                      Get.updateLocale(const Locale("en"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "EN",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "انگلیسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "English",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "en" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[0] = !langs[0];
                          langs[0] = value;
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
                      langs[1] = !langs[1];
                      Get.updateLocale(const Locale("fa"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "FA",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فارسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "Persian",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "fa" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[1] = !langs[1];
                          langs[1] = value;
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
                      langs[1] = !langs[1];
                      Get.updateLocale(const Locale("fa"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "FA",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فارسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "Persian",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "fa" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[1] = !langs[1];
                          langs[1] = value;
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
                      langs[1] = !langs[1];
                      Get.updateLocale(const Locale("fa"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "FA",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فارسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "Persian",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "fa" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[1] = !langs[1];
                          langs[1] = value;
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
                      langs[1] = !langs[1];
                      Get.updateLocale(const Locale("fa"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "FA",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فارسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "Persian",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "fa" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[1] = !langs[1];
                          langs[1] = value;
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
                      langs[1] = !langs[1];
                      Get.updateLocale(const Locale("fa"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "FA",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فارسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "Persian",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "fa" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[1] = !langs[1];
                          langs[1] = value;
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
                      langs[1] = !langs[1];
                      Get.updateLocale(const Locale("fa"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "FA",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فارسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "Persian",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "fa" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[1] = !langs[1];
                          langs[1] = value;
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
                      langs[1] = !langs[1];
                      Get.updateLocale(const Locale("fa"));
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Text(
                        "FA",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فارسی",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3B3B3B),
                    ),
                  ),
                  subtitle: const Text(
                    "Persian",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: myLocale.languageCode == "fa" ? true : false,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          langs[1] = !langs[1];
                          langs[1] = value;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
