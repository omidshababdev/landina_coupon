import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/components/coupon/coupon.dart';
import 'package:landina_coupon/ui/pages/account/profile/profile.get.dart';
import 'package:landina_coupon/ui/pages/coupon/view.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/modals/modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';
import 'package:readmore/readmore.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  Future? couponInfo;
  Future? userInfo;

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  var counter = 1;

  final profileGet = ProfileGet();

  bool? isLoading = false;

  // @override
  // void initState() {
  //   userInfo = Config.client.getUser(Config.box.read("myId"));
  //   couponInfo = Config.client.getUserCoupons(Config.box.read("myId"));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "account".tr,
          titleOnTap: () {
            landinaModal(
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "???????? ?????? ????",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: !context.isDarkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "?????????? ?????????? ???????? ???? ?????? ???????? ???? ?????????? ???? ????????. ???????? ???? ???????? ?????????? ?????? ???? :)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: !context.isDarkMode
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        LandinaTextButton(
                          title: "???????? ??????",
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              context,
            );
          },
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {
            landinaModal(StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      ButtonBarSuper(
                        lineSpacing: 15,
                        wrapType: WrapType.balanced,
                        wrapFit: WrapFit.divided,
                        children: [
                          LandinaTextButton(
                            title: "??????????????",
                            onPressed: () {
                              Navigator.pop(context);
                              Get.toNamed("/settings");
                            },
                          ),
                          LandinaTextButton(
                            title: "???????????? ??????????",
                            isLoading: isLoading,
                            onPressed: () async {
                              setState(() => isLoading = true);
                            },
                          ),
                          LandinaTextButton(
                            title: "???? ???????? ???? ?????????? ???????? ??????",
                            backgroundColor: true,
                            onPressed: () {
                              landinaModal(
                                StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "?????????? ???????????? ???? ?????????? ???????? ????????",
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
                                                title: "?????? ???????? ????",
                                                backgroundColor: true,
                                                onPressed: () async {
                                                  Config.box.remove("username");
                                                  Config.box.remove("email");
                                                  Config.box.remove("password");

                                                  setState(() {
                                                    Config.loggedIn = false;
                                                  });

                                                  Navigator.pop(context);

                                                  Get.back();
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
                                    );
                                  },
                                ),
                                context,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ), context);
          },
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Get.back();
          },
        ),
      ),
      body: FutureBuilder(
        future: userInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                landinaModal(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: ButtonBarSuper(
                                        lineSpacing: 15,
                                        wrapType: WrapType.balanced,
                                        wrapFit: WrapFit.divided,
                                        children: [
                                          LandinaTextButton(
                                            title: "?????????????? ???? ????????????",
                                            onPressed: () {
                                              Navigator.pop(context);

                                              profileGet.uploadImage(
                                                  ImageSource.camera);
                                            },
                                          ),
                                          LandinaTextButton(
                                            title: "???????????? ???? ??????????",
                                            backgroundColor: true,
                                            onPressed: () {
                                              Navigator.pop(context);

                                              profileGet.uploadImage(
                                                  ImageSource.gallery);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    context);
                              },
                              child: Obx(
                                () => profileGet.profileImage.value != null &&
                                        profileGet.profileImage.value!.path !=
                                            ''
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: ShapeDecoration(
                                          color: !context.isDarkMode
                                              ? Colors.black.withOpacity(0.05)
                                              : Colors.white.withOpacity(0.05),
                                          image: DecorationImage(
                                            image: FileImage(
                                              profileGet.profileImage.value!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: SmoothRectangleBorder(
                                            borderRadius: SmoothBorderRadius(
                                              cornerRadius: 18,
                                              cornerSmoothing: 0.5,
                                            ),
                                          ),
                                        ),
                                      )
                                    : snapshot.data!.image != null
                                        ? Container(
                                            width: 80,
                                            height: 80,
                                            decoration: ShapeDecoration(
                                              color: !context.isDarkMode
                                                  ? Colors.black
                                                      .withOpacity(0.05)
                                                  : Colors.white
                                                      .withOpacity(0.05),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "${Config.baseUrl}users/image/${Config.box.read("myId")}",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: SmoothRectangleBorder(
                                                borderRadius:
                                                    SmoothBorderRadius(
                                                  cornerRadius: 18,
                                                  cornerSmoothing: 0.5,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 80,
                                            height: 80,
                                            decoration: ShapeDecoration(
                                              color: !context.isDarkMode
                                                  ? Colors.black
                                                      .withOpacity(0.05)
                                                  : Colors.white
                                                      .withOpacity(0.05),
                                              shape: SmoothRectangleBorder(
                                                borderRadius:
                                                    SmoothBorderRadius(
                                                  cornerRadius: 18,
                                                  cornerSmoothing: 0.5,
                                                ),
                                              ),
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
                                    GestureDetector(
                                      onTap: () {
                                        nameController.text =
                                            snapshot.data!.name;
                                        landinaModal(
                                          StatefulBuilder(
                                            builder: (BuildContext context,
                                                setState) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "???????????? ?????? ???????? ????????????",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            !context.isDarkMode
                                                                ? Colors.black
                                                                : Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      "?????? ???????? ?????? ???????? ???? ???? ???????????? ???????? ???? ?????? ?????????? ?????? ???? ???????? ???? ...",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            !context.isDarkMode
                                                                ? Colors.black
                                                                : Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 25),
                                                    LandinaTextField(
                                                      hintText:
                                                          "?????? ???????? ????????????",
                                                      maxLines: 1,
                                                      textfieldController:
                                                          nameController,
                                                      prefixIcon:
                                                          IconlyLight.paper,
                                                      prefixIconOnPressed:
                                                          () {},
                                                      suffixIcon: IconlyLight
                                                          .info_circle,
                                                      suffixIconOnPressed:
                                                          () {},
                                                      obscureText: false,
                                                      enabled: true,
                                                    ),
                                                    const SizedBox(height: 15),
                                                    LandinaTextButton(
                                                      title:
                                                          "?????????? ?????? ???????? ????????????",
                                                      isLoading: isLoading,
                                                      onPressed: () async {
                                                        setState(() {
                                                          isLoading = true;
                                                        });

                                                        await Future.delayed(
                                                            const Duration(
                                                                seconds: 5),
                                                            () {
                                                          setState(() {
                                                            isLoading = false;
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        });
                                                        await Config.client
                                                            .updateUser(
                                                          "name",
                                                          nameController.text,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          context,
                                        );
                                      },
                                      child: Text(
                                        snapshot.data!.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: !context.isDarkMode
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        landinaModal(
                                          StatefulBuilder(
                                            builder: (BuildContext context,
                                                setState) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30),
                                                child: ButtonBarSuper(
                                                  lineSpacing: 15,
                                                  wrapType: WrapType.balanced,
                                                  wrapFit: WrapFit.divided,
                                                  children: [
                                                    LandinaTextButton(
                                                      title: "????????",
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    LandinaTextButton(
                                                      title: "?????? ?? ??????",
                                                      backgroundColor: true,
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          context,
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: !context.isDarkMode
                                              ? Colors.black.withOpacity(0.05)
                                              : Colors.white.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          snapshot.data!.accountType,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: !context.isDarkMode
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                GestureDetector(
                                  onTap: () {
                                    usernameController.text =
                                        snapshot.data!.username;
                                    landinaModal(
                                      StatefulBuilder(
                                        builder:
                                            (BuildContext context, setState) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "???????????? ?????? ????????????",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: !context.isDarkMode
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "?????? ???????? ?????? ?????? ???????????? ???? ???? ???????? ?????????? ???????? ???? ???????? ????. ?????????? ???????? ???? ???????? ?????????????? ?? ???????? ?????????? ????????.",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: !context.isDarkMode
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 25),
                                                LandinaTextField(
                                                  hintText: "?????? ????????????",
                                                  maxLines: 1,
                                                  textfieldController:
                                                      usernameController,
                                                  prefixIcon: IconlyLight.paper,
                                                  prefixIconOnPressed: () {},
                                                  suffixIcon:
                                                      IconlyLight.info_circle,
                                                  suffixIconOnPressed: () {},
                                                  obscureText: false,
                                                  enabled: true,
                                                ),
                                                const SizedBox(height: 15),
                                                LandinaTextButton(
                                                  title: "?????????? ?????? ????????????",
                                                  isLoading: isLoading,
                                                  onPressed: () async {
                                                    setState(() {
                                                      isLoading = true;
                                                    });

                                                    await Future.delayed(
                                                        const Duration(
                                                            seconds: 5), () {
                                                      setState(() {
                                                        isLoading = false;
                                                        Navigator.pop(context);
                                                      });
                                                    });
                                                    await Config.client
                                                        .updateUser(
                                                      "username",
                                                      usernameController.text,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      context,
                                    );
                                  },
                                  child: Text(
                                    snapshot.data!.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      color: !context.isDarkMode
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            bioController.text = snapshot.data!.bio;
                            landinaModal(
                              StatefulBuilder(
                                builder: (BuildContext context, setState) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "???????????? ?????????????? ????????",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: !context.isDarkMode
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "?????? ???????? ?????? ???????????????? ???? ???? ???????? ?????????? ???????? ???? ???????? ????..",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: !context.isDarkMode
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                        LandinaTextField(
                                          hintText: "?????????????? ????????",
                                          minLines: 1,
                                          maxLines: 3,
                                          textfieldController: bioController,
                                          prefixIcon: IconlyLight.paper,
                                          prefixIconOnPressed: () {},
                                          suffixIcon: IconlyLight.info_circle,
                                          suffixIconOnPressed: () {},
                                          obscureText: false,
                                          enabled: true,
                                        ),
                                        const SizedBox(height: 15),
                                        LandinaTextButton(
                                          title: "?????????? ?????????????? ????????",
                                          isLoading: isLoading,
                                          onPressed: () async {
                                            setState(() {
                                              isLoading = true;
                                            });

                                            await Future.delayed(
                                                const Duration(seconds: 5), () {
                                              setState(() {
                                                isLoading = false;
                                                Navigator.pop(context);
                                              });
                                            });
                                            await Config.client.updateUser(
                                              "bio",
                                              bioController.text,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              context,
                            );
                          },
                          child: ReadMoreText(
                            snapshot.data!.bio,
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '??????????',
                            trimExpandedText: '',
                            moreStyle: TextStyle(
                              height: 2,
                              fontWeight: FontWeight.w600,
                              color: !context.isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              height: 2,
                              color: !context.isDarkMode
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ButtonBarSuper(
                      lineSpacing: 10,
                      wrapType: WrapType.balanced,
                      wrapFit: WrapFit.divided,
                      children: [
                        LandinaTextButton(
                          title: '???????? ????????',
                          onPressed: () {
                            Get.toNamed("coupon/new");
                          },
                        ),
                        LandinaTextButton(
                          title: '?????????? ?????????? ????',
                          onPressed: () {
                            Get.toNamed("/followers");
                          },
                        ),
                        LandinaTextButton(
                          title: '???????? ????',
                          onPressed: () {
                            Get.toNamed("/chats");
                          },
                        ),
                        LandinaTextButton(
                          title: '?????????????? ????????',
                          onPressed: () {
                            Get.toNamed("/contacts");
                          },
                        ),
                        LandinaTextButton(
                          title: '???????? ?????? ????',
                          onPressed: () {
                            Get.toNamed("/links");
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  FutureBuilder(
                    future:
                        Config.client.getUserCoupons(Config.box.read("myId")),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                            parent: ClampingScrollPhysics(),
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            final couponInfo = snapshot.data![index];
                            return Coupon(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CouponPage(couponInfo: couponInfo),
                                  ),
                                );
                              },
                              couponId: couponInfo.id,
                              userId: couponInfo.userId,
                              title: couponInfo.name,
                              description: couponInfo.desc,
                              couponCode: couponInfo.code,
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
                              Get.reload();
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
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: LandinaIconButton(
                  icon: Ionicons.reload,
                  onPressed: () async {
                    Get.reload();
                  },
                ),
              );
            } else {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/not_found.svg",
                      color: !context.isDarkMode ? Colors.black : Colors.white,
                      width: 250,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "???????? ?????? ?????????? ?????????? ????????!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color:
                            !context.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }
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
                              color: !context.isDarkMode
                                  ? Colors.black.withOpacity(0.05)
                                  : Colors.white.withOpacity(0.05),
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
                                  color: !context.isDarkMode
                                      ? Colors.black.withOpacity(0.05)
                                      : Colors.white.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: 150,
                                height: 15,
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
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                          color: !context.isDarkMode
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                          color: !context.isDarkMode
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
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
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: LandinaIconButton(
                icon: Ionicons.reload,
                onPressed: () {
                  Get.reload();
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
                              color: !context.isDarkMode
                                  ? Colors.black.withOpacity(0.05)
                                  : Colors.white.withOpacity(0.05),
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
                                  color: !context.isDarkMode
                                      ? Colors.black.withOpacity(0.05)
                                      : Colors.white.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: 150,
                                height: 15,
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
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                          color: !context.isDarkMode
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                          color: !context.isDarkMode
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
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
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              ],
            );
          }
        },
      ),
    );
  }
}
