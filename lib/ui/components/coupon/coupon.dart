import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:landina_coupon/ui/components/modals/copyCoupon.modal.dart';
import 'package:landina_coupon/ui/pages/brand/brand.dart';
import 'package:landina_coupon/ui/pages/coupon/coupon.dart';
import 'package:landina_coupon/ui/pages/web/web.page.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/components/modals/login.modal.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:get/get.dart';

class Coupon extends StatelessWidget {
  final String title;
  final String brand;
  final String description;
  const Coupon(
      {super.key,
      required this.title,
      required this.brand,
      required this.description});

  @override
  Widget build(BuildContext context) {
    bool brandName = true;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CouponPage();
            },
          ),
        );
      },
      onLongPress: () {
        loginModal(context);
      },
      child: Container(
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/brand");
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      brandName == true
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WebPage(),
                                  ),
                                );
                              },
                              child: Text(
                                brand,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
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
                        loginModal(context);
                      },
                      icon: SvgPicture.asset(
                        "assets/svg/reorder-two-outline.svg",
                        color: const Color(0xff3B3B3B).withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                height: 2,
                color: const Color(0xff3B3B3B).withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 30),
            LandinaTextButton(
              title: AppLocalizations.of(context)!.copyCouponCode,
              backgroundColor: false,
              onPressed: () {
                copyCouponModal(context);
                Clipboard.setData(
                  const ClipboardData(text: "salambehamegi"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
