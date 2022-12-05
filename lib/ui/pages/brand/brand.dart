import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/components/modals/about.modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrandPage extends StatelessWidget {
  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: AppLocalizations.of(context)!.brand.capitalize(),
          rightIcon: IconlyLight.category,
          rightIconOnPressed: () {},
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        key: const PageStorageKey<String>('profile'),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
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
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.appName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        IconlyBold.tick_square,
                        size: 18,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.brand,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xff3B3B3B).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "توسعه نرم افزار",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color(0xff3B3B3B).withOpacity(0.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      aboutModal(context);
                    },
                    child: Text(
                      "landina.co",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xff3B3B3B).withOpacity(0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "۷۵۶",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: const Color(0xff3B3B3B).withOpacity(0.8),
                        ),
                      ),
                      Text(
                        " دنبال کننده",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xff3B3B3B).withOpacity(0.8),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "لورم ایپسوم متنی ساختگی با محتوایی نامفهوم از صنعت چاپ برای بهتر کردن دیزاین کار ها است.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: const Color(0xff3B3B3B).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
