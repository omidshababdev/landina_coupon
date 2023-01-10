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
              title: 'زبان برنامه',
              rightIcon: Ionicons.reorder_two,
              rightIconOnPressed: () {},
              leftIcon: IconlyLight.arrow_left,
              leftIconOnPressed: () {
                Get.back();
              },
            ),
          ),
          body: ListView(
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
                      child: Icon(Ionicons.rocket_outline),
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
            ],
          )),
    );
  }
}
