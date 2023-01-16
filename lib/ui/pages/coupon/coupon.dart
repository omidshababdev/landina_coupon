import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/coupon.model.dart';
import 'package:landina_coupon/ui/components/comments/comments.dart';
import 'package:landina_coupon/ui/pages/account/view.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:readmore/readmore.dart';

class CouponPage extends StatefulWidget {
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
          key: PageStorageKey(widget.couponInfo.id),
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
                      color:
                          Config.darkMode != true ? Colors.black : Colors.white,
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
                      color:
                          Config.darkMode != true ? Colors.black : Colors.white,
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      height: 2,
                      fontWeight: FontWeight.w400,
                      color:
                          Config.darkMode != true ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                          future: widget.userInfo,
                          builder: (context, snapshot) {
                            final userInfo = snapshot.data;
                            if (snapshot.connectionState ==
                                    ConnectionState.done ||
                                snapshot.connectionState ==
                                    ConnectionState.active) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      userInfo!.id == Config.box.read("myId")
                                          ? Get.toNamed("/profile")
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AccountPage(user: userInfo),
                                              ),
                                            );
                                    },
                                    child: snapshot.data.image != null
                                        ? Container(
                                            width: 50,
                                            height: 50,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xffF1F1F1),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "${Config.baseUrl}users/image/${snapshot.data!.id}",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: SmoothRectangleBorder(
                                                borderRadius:
                                                    SmoothBorderRadius(
                                                  cornerRadius: 10,
                                                  cornerSmoothing: 0.5,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 50,
                                            height: 50,
                                            decoration: ShapeDecoration(
                                              color: Config.darkMode != true
                                                  ? Colors.black
                                                      .withOpacity(0.05)
                                                  : Colors.white
                                                      .withOpacity(0.05),
                                              shape: SmoothRectangleBorder(
                                                borderRadius:
                                                    SmoothBorderRadius(
                                                  cornerRadius: 10,
                                                  cornerSmoothing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          userInfo!.id ==
                                                  Config.box.read("myId")
                                              ? Get.toNamed("/profile")
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AccountPage(
                                                            user: userInfo),
                                                  ),
                                                );
                                        },
                                        child: Text(
                                          snapshot.data!.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Config.darkMode != true
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          userInfo!.id ==
                                                  Config.box.read("myId")
                                              ? Get.toNamed("/profile")
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AccountPage(
                                                            user: userInfo),
                                                  ),
                                                );
                                        },
                                        child: Text(
                                          snapshot.data!.username,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Config.darkMode != true
                                                ? Colors.black.withOpacity(0.5)
                                                : Colors.white.withOpacity(0.5),
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
                                      color: Config.darkMode != true
                                          ? Colors.black.withOpacity(0.05)
                                          : Colors.white.withOpacity(0.05),
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
                                          color: Config.darkMode != true
                                              ? Colors.black.withOpacity(0.05)
                                              : Colors.white.withOpacity(0.05),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: 100,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Config.darkMode != true
                                              ? Colors.black.withOpacity(0.05)
                                              : Colors.white.withOpacity(0.05),
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
                                      color: Config.darkMode != true
                                          ? Colors.black.withOpacity(0.05)
                                          : Colors.white.withOpacity(0.05),
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
                                          color: Config.darkMode != true
                                              ? Colors.black.withOpacity(0.05)
                                              : Colors.white.withOpacity(0.05),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: 100,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Config.darkMode != true
                                              ? Colors.black.withOpacity(0.05)
                                              : Colors.white.withOpacity(0.05),
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
                        color: Config.darkMode != true
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
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
                          color: Config.darkMode != true
                              ? Colors.black
                              : Colors.white,
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "کوپن کپی شد!",
                                  style: TextStyle(
                                    color: Config.darkMode != true
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "حالا می تونی با جایگذاری در محل مناسب ازش استفاده کنی.",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Config.darkMode != true
                                        ? Colors.black
                                        : Colors.white,
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
                          ),
                          context);
                      Clipboard.setData(
                        ClipboardData(text: widget.couponInfo.code),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1,
                              color: Config.darkMode != true
                                  ? const Color(0xffF1F1F1).withOpacity(0.5)
                                  : const Color(0xffF1F1F1).withOpacity(0.1),
                            ),
                          ),
                          child: Wrap(
                            spacing: 5,
                            children: const [
                              Icon(
                                CupertinoIcons.hand_thumbsup,
                                size: 15,
                              ),
                              Text(
                                "47,689",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1,
                              color: Config.darkMode != true
                                  ? const Color(0xffF1F1F1).withOpacity(0.5)
                                  : const Color(0xffF1F1F1).withOpacity(0.1),
                            ),
                          ),
                          child: Wrap(
                            spacing: 5,
                            children: const [
                              Icon(
                                CupertinoIcons.hand_thumbsdown,
                                size: 15,
                              ),
                              Text(
                                "689",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1,
                              color: Config.darkMode != true
                                  ? const Color(0xffF1F1F1).withOpacity(0.5)
                                  : const Color(0xffF1F1F1).withOpacity(0.1),
                            ),
                          ),
                          child: Wrap(
                            spacing: 5,
                            children: const [
                              Icon(
                                CupertinoIcons.share,
                                size: 15,
                              ),
                              Text(
                                "اشتراک گذاری",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Comments(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
