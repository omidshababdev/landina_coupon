import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/coupon.model.dart';
import 'package:landina_coupon/models/user.model.dart';
import 'package:landina_coupon/services/api.services.dart';
import 'package:landina_coupon/services/notification.services.dart';
import 'package:landina_coupon/ui/components/coupon/coupon.dart';
import 'package:landina_coupon/ui/pages/coupon/view.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/modals/modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  UserModel? user;
  Future? userInfo;

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<CouponModel>? coupons;
  String? query = "";

  @override
  void initState() {
    super.initState();
    init();

    allowNotifModal(context);
  }

  Future init() async {
    final coupons = await ApiServices.searchCoupons(query);

    setState(() {
      if (query != null) {
        this.coupons = coupons;
      }
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
            title: "appName".tr,
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {
              landinaModal(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ButtonBarSuper(
                      lineSpacing: 15,
                      wrapType: WrapType.balanced,
                      wrapFit: WrapFit.divided,
                      children: [
                        LandinaTextButton(
                          title: "?????????? ????",
                          onPressed: () {
                            Navigator.pop(context);
                            Get.toNamed("/notifications");
                          },
                        ),
                        LandinaTextButton(
                          title: '???????? ???????? ????',
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              Get.toNamed("/categories");
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  context);
            },
            leftIcon: IconlyLight.profile,
            leftIconOnPressed: () {
              Config.box.read("username") == null &&
                      Config.box.read("password") == null
                  ? landinaModal(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ButtonBarSuper(
                          lineSpacing: 15,
                          wrapType: WrapType.balanced,
                          wrapFit: WrapFit.divided,
                          children: [
                            LandinaTextButton(
                              title: "loginToAccount".tr,
                              onPressed: () {
                                Navigator.pop(context);
                                Get.toNamed("/login");
                              },
                            ),
                            LandinaTextButton(
                              title: "createAnAccount".tr,
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  Get.toNamed("/signup/email");
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      context)
                  : {
                      setState(() {
                        widget.userInfo = Config.client.loginUser(
                            Config.box.read("username"),
                            Config.box.read("password"));
                      }),
                      Get.toNamed("/profile"),
                    };
            },
          ),
        ),
        body: Column(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1,
                        color: !context.isDarkMode
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
                      ),
                    ),
                  ),
                  child: LandinaTextField(
                    onChanged: (value) {
                      searchCoupons(searchController.text);
                    },
                    textfieldController: searchController,
                    hintText: "searchField".tr,
                    maxLines: 1,
                    prefixIcon: IconlyLight.search,
                    prefixIconOnPressed: () {},
                    suffixIcon: IconlyLight.filter,
                    suffixIconOnPressed: () {
                      landinaModal(
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "?????????? ???????? ???????? ???? ???????????? ????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "???? ?????? ???????? ???? ???????? ???????? ???? ???? ???? ???????? ?????????? ?????? ?????? ?????????? ??????.",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: !context.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
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
                                          color: !context.isDarkMode
                                              ? const Color(0xffF1F1F1)
                                                  .withOpacity(0.5)
                                              : const Color(0xffF1F1F1)
                                                  .withOpacity(0.1),
                                        ),
                                      ),
                                      child: const Text(
                                        "???????????????? ????",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              LandinaTextButton(
                                title: "?????????????? ?????????? ???? ?????????? ????",
                                backgroundColor: true,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        context,
                      );
                    },
                    obscureText: false,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiServices.searchCoupons(query),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        key: const PageStorageKey<String>('home'),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                          parent: ClampingScrollPhysics(),
                        ),
                        itemCount: coupons!.length,
                        itemBuilder: (context, index) {
                          final couponInfo = coupons![index];
                          return Coupon(
                            couponId: couponInfo.id,
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
                    } else if (snapshot.hasError) {
                      return Center(
                        child: LandinaIconButton(
                          icon: Ionicons.reload,
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      super.widget),
                            );
                          },
                        ),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/not_found.svg",
                              color: !context.isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                              width: 250,
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "???????? ?????? ?????????? ?????????? ????????!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: !context.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
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
                            color: !context.isDarkMode
                                ? Colors.black.withOpacity(0.05)
                                : Colors.white.withOpacity(0.08),
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
                        onPressed: () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    super.widget),
                          );
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

  Future searchCoupons(String query) async {
    final coupons = await ApiServices.searchCoupons(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.coupons = coupons;
    });
  }
}
