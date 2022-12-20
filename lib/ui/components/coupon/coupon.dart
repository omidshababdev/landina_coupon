import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/user.dart';
import 'package:landina_coupon/ui/pages/account/account.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:get/get.dart';

class Coupon extends StatefulWidget {
  String? userId;
  String? title;
  String? description;
  String? couponCode;
  VoidCallback? onTap;

  Coupon({
    super.key,
    this.userId,
    this.title,
    this.description,
    this.couponCode,
    this.onTap,
  });

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: () {
        landinaModal(Text("data"));
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 325,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 20,
              cornerSmoothing: 0.5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder(
                  future: Config.client.getUser('${widget.userId}'),
                  builder: (context, snapshot) {
                    final userInfo = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.done ||
                        snapshot.connectionState == ConnectionState.active) {
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
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Text(
                                  snapshot.data!.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
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
                        snapshot.connectionState == ConnectionState.none) {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF1F1F1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF1F1F1),
                                  borderRadius: BorderRadius.circular(20),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF1F1F1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF1F1F1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffF1F1F1).withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        landinaModal(
                          Wrap(
                            runSpacing: 15,
                            children: [
                              LandinaTextButton(
                                title: "گزارش خطا",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              LandinaTextButton(
                                title: "می خوام ذخیرش کنم",
                                backgroundColor: true,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Ionicons.reorder_two),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                Text(
                  '${widget.title}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff3B3B3B).withOpacity(1),
                  ),
                ),
                Text(
                  '${widget.description}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 2,
                    color: const Color(0xff3B3B3B).withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            LandinaTextButton(
              title: AppLocalizations.of(context)!.copyCouponCode,
              backgroundColor: false,
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
                  ClipboardData(text: widget.couponCode),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
