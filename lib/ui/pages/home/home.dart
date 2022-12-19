import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/coupon.dart';
import 'package:landina_coupon/models/user.dart';
import 'package:landina_coupon/ui/components/coupon/coupon.dart';
import 'package:landina_coupon/ui/pages/coupon/coupon.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  UserModel? user;
  Future? userInfo;
  Future? allCoupons;
  Future? timelineCoupons;

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    setState(() {
      widget.allCoupons = Config.client.allCoupons();
      widget.timelineCoupons =
          Config.client.timelineCoupons(Config.box.read("myId"));
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
                        widget.userInfo = Config.client.loginUser(
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
              child: FutureBuilder(
                future: Config.loggedIn != true
                    ? widget.timelineCoupons
                    : widget.allCoupons,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData != true) {
                      return ListView.separated(
                        key: const PageStorageKey<String>('home'),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final couponInfo = snapshot.data![index];
                          return Coupon(
                            userId: couponInfo.userId,
                            title: couponInfo.name,
                            description: couponInfo.desc,
                            couponCode: couponInfo.code,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CouponPage(couponInfo: couponInfo),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/not_found.png",
                              width: 250,
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "هنوز هیچ کوپنی اینجا نیست!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff3B3B3B).withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: ShapeDecoration(
                            color: const Color(0xffF1F1F1),
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 20,
                                cornerSmoothing: 0.5,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Center(
                      child: LandinaIconButton(
                        icon: Ionicons.reload,
                        onPressed: () {
                          setState(() {
                            // Reload Page
                          });
                        },
                      ),
                    );
                  } else {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: ShapeDecoration(
                            color: const Color(0xffF1F1F1),
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 20,
                                cornerSmoothing: 0.5,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
