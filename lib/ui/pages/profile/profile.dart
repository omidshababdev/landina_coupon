import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/user.dart';
import 'package:landina_coupon/services/api.services.dart';
import 'package:landina_coupon/ui/components/modals/about.modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Config.inProfile = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: AppLocalizations.of(context)!.account.capitalize(),
          rightIcon: IconlyLight.logout,
          rightIconOnPressed: () {
            aboutModal(context);
          },
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
          parent: ClampingScrollPhysics(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 15,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: const Color(0xffF1F1F1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 18,
                            cornerSmoothing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xffF1F1F1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: 150,
                            height: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xffF1F1F1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: ShapeDecoration(
              color: const Color(0xffF1F1F1),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 20,
                  cornerSmoothing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: ShapeDecoration(
              color: const Color(0xffF1F1F1),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 20,
                  cornerSmoothing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: ShapeDecoration(
              color: const Color(0xffF1F1F1),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 20,
                  cornerSmoothing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
