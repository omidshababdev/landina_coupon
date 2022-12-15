import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/services/api.services.dart';
import 'package:landina_coupon/ui/components/coupon/coupon.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

import 'package:get/get.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();
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
            title: AppLocalizations.of(context)!.appName,
            rightIcon: IconlyLight.category,
            rightIconOnPressed: () {
              Get.toNamed('/categories');
            },
            leftIcon: IconlyLight.profile,
            leftIconOnPressed: () {
              Config.box.read("email") == null &&
                      Config.box.read("pass") == null
                  ? landinaModal(
                      Column(
                        children: [
                          LandinaTextButton(
                            title: AppLocalizations.of(context)!.loginToAccount,
                            onPressed: () {
                              Navigator.pop(context);
                              Get.toNamed("/login");
                            },
                          ),
                          const SizedBox(height: 15),
                          LandinaTextButton(
                            title:
                                AppLocalizations.of(context)!.createAnAccount,
                            onPressed: () {
                              Navigator.pop(context);
                              Get.toNamed("/signUp");
                            },
                          ),
                        ],
                      ),
                    )
                  : {
                      setState(() {
                        Config.myInfo = Config.client.loginUser(
                            Config.box.read("email"), Config.box.read("pass"));
                      }),
                      Get.toNamed("/profile"),
                    };
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: 1,
                    color: Color(0xffF1F1F1),
                  ),
                ),
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: LandinaTextField(
                  hintText: AppLocalizations.of(context)!.searchField,
                  prefixIcon: IconlyLight.search,
                  prefixIconOnPressed: () {},
                  suffixIcon: IconlyLight.filter,
                  suffixIconOnPressed: () {
                    landinaModal(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "فیلتر مورد نظرت رو انتخاب کن",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "از این قسمت می تونی کوپن ها رو بر اساس فیلتر های زیر فیلتر کنی.",
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xff3B3B3B).withOpacity(0.5),
                              height: 2,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            children: [
                              ...List.generate(
                                6,
                                (index) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1),
                                    ),
                                  ),
                                  child: Text(
                                    "جدیدترین ها",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          LandinaTextButton(
                            title: "تغییرات فیلتر رو اعمال کن",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  obscureText: false,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                key: const PageStorageKey<String>('home'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Coupon(
                    title: AppLocalizations.of(context)!.couponTextTitle,
                    brand: AppLocalizations.of(context)!.brandName,
                    description:
                        AppLocalizations.of(context)!.couponDescription,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
