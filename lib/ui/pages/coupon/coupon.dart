import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/coupon.dart';
import 'package:landina_coupon/models/user.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:readmore/readmore.dart';

class CouponPage extends StatefulWidget {
  UserModel? user;
  Future? userInfo;

  final CouponModel couponInfo;
  CouponPage({super.key, required this.couponInfo});

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  void initState() {
    super.initState();

    setState(() {
      widget.userInfo = Config.client.getUser(widget.couponInfo.userId);
    });
  }

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
            title: AppLocalizations.of(context)!.coupon.capitalizeFirst,
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {},
            leftIcon: IconlyLight.arrow_left,
            leftIconOnPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          key: PageStorageKey<String>(widget.couponInfo.id),
          padding: const EdgeInsets.symmetric(vertical: 20),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
            parent: ClampingScrollPhysics(),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.couponInfo.name,
                    style: TextStyle(
                      fontSize: 16,
                      height: 2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff3B3B3B).withOpacity(1),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ReadMoreText(
                    widget.couponInfo.desc,
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'بیشتر',
                    trimExpandedText: '',
                    moreStyle: TextStyle(
                      fontSize: 13,
                      height: 2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff3B3B3B).withOpacity(1),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      height: 2,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff3B3B3B).withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                          future: widget.userInfo,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done ||
                                snapshot.connectionState ==
                                    ConnectionState.active) {
                              return Wrap(
                                spacing: 15,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/account");
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xffF1F1F1),
                                        shape: SmoothRectangleBorder(
                                          borderRadius: SmoothBorderRadius(
                                            cornerRadius: 10,
                                            cornerSmoothing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed("/account");
                                        },
                                        child: Text(
                                          snapshot.data!.username,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff3B3B3B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                snapshot.connectionState ==
                                    ConnectionState.none) {
                              return Wrap(
                                spacing: 15,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xffF1F1F1),
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius(
                                          cornerRadius: 10,
                                          cornerSmoothing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: 100,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Wrap(
                                spacing: 15,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xffF1F1F1),
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius(
                                          cornerRadius: 10,
                                          cornerSmoothing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: 100,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                      LandinaIconButton(
                        icon: IconlyLight.bookmark,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xff3B3B3B).withOpacity(0.05),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SelectableText(
                        widget.couponInfo.code,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: const Color(0xff3B3B3B).withOpacity(1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  LandinaTextButton(
                    title: AppLocalizations.of(context)!.copyCouponCode,
                    backgroundColor: true,
                    onPressed: () {
                      landinaModal(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "کوپن کپی شد!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "حالا می تونی با جایگذاری در محل مناسب ازش استفاده کنی.",
                              style: TextStyle(
                                fontSize: 13,
                                color: const Color(0xff3B3B3B).withOpacity(0.5),
                                height: 2,
                              ),
                            ),
                            const SizedBox(height: 30),
                            LandinaTextButton(
                              title: "ثبت نظر",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                      Clipboard.setData(
                        ClipboardData(text: widget.couponInfo.code),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
