import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/user.model.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:get/get.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:readmore/readmore.dart';

class AccountPage extends StatefulWidget {
  UserModel? user;

  Future? userInfo;

  Future? unfollow;
  Future? follow;

  AccountPage({super.key, this.user});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool? isFollowed;
  @override
  void initState() {
    super.initState();

    setState(() {
      widget.userInfo = Config.client.getUser(widget.user!.id);

      Config.client
          .getFollowedUser(Config.box.read("myId"), widget.user!.id.toString())
          .then((value) => print(isFollowed = value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: AppLocalizations.of(context)!.brandName.capitalizeFirst,
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {},
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: widget.userInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done ||
              snapshot.hasData) {
            return ListView(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 8,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    "${widget.user!.name}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF1F1F1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      "${widget.user!.accountType}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color(0xff3B3B3B)
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "${widget.user!.username}",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff3B3B3B).withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ReadMoreText(
                        "${widget.user!.bio}",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'بیشتر',
                        trimExpandedText: '',
                        moreStyle: TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff3B3B3B).withOpacity(1),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 2,
                          color: const Color(0xff3B3B3B).withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ButtonBarSuper(
                  lineSpacing: 15,
                  wrapType: WrapType.balanced,
                  wrapFit: WrapFit.divided,
                  children: [
                    LandinaTextButton(
                      title: isFollowed != true
                          ? "${AppLocalizations.of(context)!.follow.capitalizeFirst}"
                          : "${AppLocalizations.of(context)!.follow.capitalizeFirst}ed",
                      backgroundColor: isFollowed != true ? true : false,
                      onPressed: () {
                        setState(() {
                          isFollowed != true
                              ? {
                                  Config.client
                                      .followUser(widget.user!.id.toString()),
                                  setState(() {}),
                                  isFollowed = true,
                                }
                              : landinaModal(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: LandinaTextButton(
                                      title:
                                          "Un${AppLocalizations.of(context)!.follow}",
                                      onPressed: () {
                                        setState(() {
                                          Config.client.unfollowUser(
                                              widget.user!.id.toString());
                                          isFollowed = false;
                                          setState(() {});
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                  ),
                                );
                        });
                      },
                    ),
                    LandinaTextButton(
                      title: 'لینک ها',
                      onPressed: () {
                        Get.toNamed("/links");
                      },
                    ),
                    LandinaTextButton(
                      title: 'اطلاعات تماس',
                      onPressed: () {
                        Get.toNamed("/contacts");
                      },
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
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
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView(
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
                          Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: LandinaIconButton(
                icon: Ionicons.reload,
                onPressed: () {
                  setState(() {
                    // Reload Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget),
                    );
                  });
                },
              ),
            );
          } else {
            return ListView(
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
                          Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            );
          }
        },
      ),
    );
  }
}
