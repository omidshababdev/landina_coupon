import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/pages/account/view.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/modals/modal.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

import 'package:get/get.dart';

class Coupon extends StatefulWidget {
  String? couponId;
  String? userId;
  String? title;
  String? description;
  String? couponCode;
  VoidCallback? onTap;

  Coupon({
    super.key,
    this.couponId,
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
        landinaModal(Text("data"), context);
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 325,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: ShapeDecoration(
          color: !context.isDarkMode
              ? Colors.black.withOpacity(0.01)
              : Colors.white.withOpacity(0.05),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
                              child: snapshot.data!.image != null
                                  ? Container(
                                      width: 50,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: !context.isDarkMode
                                            ? Colors.black.withOpacity(0.05)
                                            : Colors.white.withOpacity(0.05),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "${Config.baseUrl}users/image/${snapshot.data!.id}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: SmoothRectangleBorder(
                                          borderRadius: SmoothBorderRadius(
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
                                        color: !context.isDarkMode
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
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: !context.isDarkMode
                                          ? Colors.black
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
                          snapshot.connectionState == ConnectionState.none) {
                        return Wrap(
                          spacing: 15,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: ShapeDecoration(
                                color: !context.isDarkMode
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: !context.isDarkMode
                                        ? Colors.black.withOpacity(0.05)
                                        : Colors.white.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 100,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: !context.isDarkMode
                                        ? Colors.black.withOpacity(0.05)
                                        : Colors.white.withOpacity(0.05),
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
                                color: !context.isDarkMode
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: !context.isDarkMode
                                        ? Colors.black.withOpacity(0.05)
                                        : Colors.white.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 100,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: !context.isDarkMode
                                        ? Colors.black.withOpacity(0.05)
                                        : Colors.white.withOpacity(0.05),
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
                  LandinaIconButton(
                    onPressed: () {
                      landinaModal(
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ButtonBarSuper(
                              lineSpacing: 15,
                              wrapType: WrapType.balanced,
                              wrapFit: WrapFit.divided,
                              children: [
                                if (widget.userId == Config.box.read("myId"))
                                  LandinaTextButton(
                                    title: "?????? ????????",
                                    onPressed: () {
                                      landinaModal(
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "?????????? ???????????? ???????? ????????",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                ButtonBarSuper(
                                                  lineSpacing: 15,
                                                  wrapType: WrapType.balanced,
                                                  wrapFit: WrapFit.proportional,
                                                  children: [
                                                    LandinaTextButton(
                                                      title: "???????? ????",
                                                      backgroundColor: true,
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        await Config.client
                                                            .deleteCoupon(
                                                          widget.couponId
                                                              .toString(),
                                                        );
                                                        setState(() {
                                                          //
                                                        });
                                                      },
                                                    ),
                                                    LandinaTextButton(
                                                      title: "???? ?????? ????????",
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          context);
                                    },
                                  ),
                                LandinaTextButton(
                                  title: "?????????? ??????",
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                LandinaTextButton(
                                  title: "???? ???????? ?????????? ??????",
                                  backgroundColor: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          context);
                    },
                    icon: Ionicons.reorder_two,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      height: 2,
                      fontWeight: FontWeight.w600,
                      color: !context.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${widget.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 2,
                      color: !context.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              key: const PageStorageKey<String>('CategoriesBox'),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 15,
                children: [
                  ...List.generate(
                    8,
                    (index) => Container(
                      constraints: const BoxConstraints(
                        maxWidth: 250,
                        maxHeight: 150,
                      ),
                      decoration: ShapeDecoration(
                        color: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 20,
                            cornerSmoothing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LandinaTextButton(
                title: "copyCouponCode".tr,
                backgroundColor: true,
                onPressed: () {
                  landinaModal(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "???????? ?????? ????!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "???????? ???? ???????? ???? ???????????????? ???? ?????? ?????????? ?????? ?????????????? ??????.",
                              style: TextStyle(
                                fontSize: 13,
                                color: !context.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                height: 2,
                              ),
                            ),
                            const SizedBox(height: 30),
                            LandinaTextButton(
                              title: "?????? ??????",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      context);
                  Clipboard.setData(
                    ClipboardData(text: widget.couponCode),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
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
                          color: !context.isDarkMode
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
                          color: !context.isDarkMode
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
                          color: !context.isDarkMode
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
                            "???????????? ??????????",
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
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 8,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/coupon/comments");
                    },
                    child: Wrap(
                      spacing: -15,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: !context.isDarkMode
                                ? Colors.black.withOpacity(0.05)
                                : Colors.white.withOpacity(0.05),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: !context.isDarkMode
                                ? Colors.black.withOpacity(0.05)
                                : Colors.white.withOpacity(0.05),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: !context.isDarkMode
                                ? Colors.black.withOpacity(0.05)
                                : Colors.white.withOpacity(0.05),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/coupon/comments");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 1,
                          color: !context.isDarkMode
                              ? const Color(0xffF1F1F1).withOpacity(0.5)
                              : const Color(0xffF1F1F1).withOpacity(0.1),
                        ),
                      ),
                      child: Wrap(
                        spacing: 5,
                        children: const [
                          Text(
                            "47,689",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "?????? ????????????",
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
            ),
          ],
        ),
      ),
    );
  }
}
