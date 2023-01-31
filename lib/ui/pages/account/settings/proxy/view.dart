import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/modals/modal.dart';

class ProxyPage extends StatefulWidget {
  const ProxyPage({super.key});

  @override
  State<ProxyPage> createState() => _ProxyPageState();
}

class _ProxyPageState extends State<ProxyPage> {
  bool proxyMode = false;

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
              title: 'پروکسی',
              rightIcon: Ionicons.reorder_two,
              rightIconOnPressed: () {
                landinaModal(StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          ButtonBarSuper(
                            lineSpacing: 15,
                            wrapType: WrapType.balanced,
                            wrapFit: WrapFit.divided,
                            children: [
                              LandinaTextButton(
                                title: "افزودن پروکسی جدید",
                                onPressed: () {
                                  Navigator.pop(context);
                                  Get.toNamed("/settings");
                                },
                              ),
                              LandinaTextButton(
                                title: "جستجوی پروکسی",
                                onPressed: () {},
                              ),
                              LandinaTextButton(
                                title: "حذف کردن همه پروکسی ها",
                                backgroundColor: true,
                                onPressed: () {
                                  Navigator.pop(context);

                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ), context);
              },
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
                      proxyMode = !proxyMode;
                    });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  leading: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF1F1F1),
                      foregroundColor: Color(0xff3B3B3B),
                      child: Icon(Ionicons.git_network_outline),
                    ),
                  ),
                  focusColor: const Color(0xfff1f1f1),
                  title: const Text(
                    "فعال کردن پروکسی",
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
                      value: proxyMode,
                      activeColor: const Color(0xff3B3B3B),
                      onChanged: (value) => setState(
                        () {
                          proxyMode = !proxyMode;
                          proxyMode = value;
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
