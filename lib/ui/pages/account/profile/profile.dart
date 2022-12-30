import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/components/coupon/coupon.dart';
import 'package:landina_coupon/ui/pages/coupon/coupon.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';
import 'package:readmore/readmore.dart';

class ProfilePage extends StatefulWidget {
  Future? couponInfo;
  Future? userInfo;
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  File? image;
  bool? isLoading = false;

  Future? userInfo = Config.client.getUser(Config.box.read("myId"));

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (err) {
      return "ای وای نتونستیم عکس رو بگیریم: $err";
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      widget.userInfo = Config.client.getUser(Config.box.read("myId"));
      widget.couponInfo = Config.client.getUserCoupon(Config.box.read("myId"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: AppLocalizations.of(context)!.account.capitalize(),
          titleOnTap: () {
            landinaModal(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "حساب های من",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff3B3B3B).withOpacity(1),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "بزودی امکان ورود به چند حساب رو اضافه می کنیم. فعلا با همین حسابت حال کن :)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff3B3B3B).withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 15),
                  LandinaTextButton(
                    title: "خیلی خوب",
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {
            landinaModal(
              ButtonBarSuper(
                lineSpacing: 15,
                wrapType: WrapType.balanced,
                wrapFit: WrapFit.divided,
                children: [
                  LandinaTextButton(
                    title: "تنظیمات",
                    onPressed: () {
                      Navigator.pop(context);
                      Get.toNamed("/settings");
                    },
                  ),
                  LandinaTextButton(
                    title: "تماس با پشتیبانی",
                    isLoading: isLoading,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          isLoading = false;
                          Navigator.pop(context);
                        });
                      });
                    },
                  ),
                  LandinaTextButton(
                    title: "می خوام از حسابم خارج بشم",
                    backgroundColor: true,
                    onPressed: () {
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
                ],
              ),
            );
          },
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Get.back();
          },
        ),
      ),
      body: FutureBuilder(
        future: widget.userInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
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
                                ButtonBarSuper(
                                  lineSpacing: 15,
                                  wrapType: WrapType.balanced,
                                  wrapFit: WrapFit.divided,
                                  children: [
                                    LandinaTextButton(
                                      title: "استفاده از دوربین",
                                      onPressed: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.camera);
                                      },
                                    ),
                                    LandinaTextButton(
                                      title: "انتخاب از گالری",
                                      backgroundColor: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: ShapeDecoration(
                                color: const Color(0xffF1F1F1),
                                // image: DecorationImage(
                                //   image: NetworkImage(
                                //     snapshot.data!.profilePicture,
                                //   ),
                                //   fit: BoxFit.contain,
                                // ),
                                shape: SmoothRectangleBorder(
                                  borderRadius: SmoothBorderRadius(
                                    cornerRadius: 18,
                                    cornerSmoothing: 0.5,
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
                                      setState(() {
                                        nameController.text =
                                            snapshot.data!.name;
                                      });
                                      landinaModal(
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ویرایش نام حساب کاربری",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff3B3B3B)
                                                    .withOpacity(1),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "توی فیلد زیر اسمی رو که میخوای صفحت به اون تغییر کنه رو وارد کن ...",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff3B3B3B)
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            const SizedBox(height: 25),
                                            LandinaTextField(
                                              hintText: "نام حساب کاربری",
                                              maxLines: 1,
                                              textfieldController:
                                                  nameController,
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
                                              title: "تغییر نام حساب کاربری",
                                              isLoading: isLoading,
                                              onPressed: () async {
                                                setState(() {
                                                  isLoading = true;
                                                });

                                                await Future.delayed(
                                                    const Duration(seconds: 5),
                                                    () {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                });
                                                await Config.client.updateUser(
                                                  "name",
                                                  nameController.text,
                                                );
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Text(
                                      snapshot.data!.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      landinaModal(
                                        Text(
                                          AppLocalizations.of(context)!
                                              .accountType
                                              .capitalize(),
                                        ),
                                      );
                                    },
                                    child: snapshot.data!.accountType ==
                                            'personal'
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xffF1F1F1),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Text(
                                              snapshot.data!.accountType,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: const Color(0xff3B3B3B)
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xffF1F1F1),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Text(
                                              snapshot.data!.accountType,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: const Color(0xff3B3B3B)
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    usernameController.text =
                                        snapshot.data!.username;
                                  });
                                  landinaModal(
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ویرایش نام کاربری",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff3B3B3B)
                                                .withOpacity(1),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "توی فیلد زیر نام کاربری که می خوای داشته باشی رو وارد کن. حواست باشه که باید انگلیسی و بدون فاصله باشه.",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff3B3B3B)
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                        LandinaTextField(
                                          hintText: "نام کاربری",
                                          maxLines: 1,
                                          textfieldController:
                                              usernameController,
                                          prefixIcon: IconlyLight.paper,
                                          prefixIconOnPressed: () {},
                                          suffixIcon: IconlyLight.info_circle,
                                          suffixIconOnPressed: () {},
                                          obscureText: false,
                                          enabled: true,
                                        ),
                                        const SizedBox(height: 15),
                                        LandinaTextButton(
                                          title: "تغییر نام کاربری",
                                          onPressed: () async {
                                            await Config.client.updateUser(
                                              "username",
                                              usernameController.text,
                                            );
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  snapshot.data!.username,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    color: const Color(0xff3B3B3B)
                                        .withOpacity(0.8),
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
                          setState(() {
                            bioController.text = snapshot.data!.bio;
                          });
                          landinaModal(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ویرایش توضیحات حساب",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color(0xff3B3B3B).withOpacity(1),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "توی فیلد زیر توضیحاتی که می خوای داشته باشی رو وارد کن..",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff3B3B3B)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                LandinaTextField(
                                  hintText: "توضیحات حساب",
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
                                  title: "تغییر توضیحات حساب",
                                  onPressed: () async {
                                    await Config.client.updateUser(
                                      "bio",
                                      bioController.text,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: ReadMoreText(
                          snapshot.data!.bio,
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
                        title: 'دنبال کننده ها',
                        onPressed: () {
                          Get.toNamed("/followers");
                        },
                      ),
                      LandinaTextButton(
                        title: 'دنبال شونده ها',
                        onPressed: () {
                          Get.toNamed("/followers");
                        },
                      ),
                      LandinaTextButton(
                        title: 'تنظیمات',
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
                      LandinaTextButton(
                        title: 'لینک های من',
                        onPressed: () {
                          Get.toNamed("/links");
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                FutureBuilder(
                  future: Config.client.getUserCoupon(Config.box.read("myId")),
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
                  },
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/coupon/new");
        },
        child: const Icon(
          IconlyBroken.plus,
        ),
      ),
    );
  }
}
