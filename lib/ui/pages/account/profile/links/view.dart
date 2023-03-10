import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';

// String Extension for Capitalize

import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/switch.listtile.dart';
import 'package:landina_coupon/ui/widgets/modals/modal.dart';

class LinksPage extends StatefulWidget {
  Future? userInfo;

  LinksPage({super.key});

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  @override
  void initState() {
    super.initState();

    setState(() {
      widget.userInfo = Config.client.getUserLinks(Config.box.read("myId"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "لینک های حساب",
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {
            landinaModal(
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "درباره لینک های من",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:
                              !context.isDarkMode ? Colors.black : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "در این صفحه می توانید لینک های خود را مشاهده ویرایش فعال / غیرفعال و یا حذف کنید. برای اضافه کردن لینک های جدید و کردن لینک های طولانی به اپلیکیشن لندینا لینک مراجعه کنید.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              !context.isDarkMode ? Colors.black : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      LandinaTextButton(
                        title: "اضافه کردن لینک جدید",
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                context);
          },
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: widget.userInfo,
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView(
                key: PageStorageKey<String>('{$user.name}Links'),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                children: [
                  ListView.builder(
                    key: PageStorageKey<String>('{$user.name}Links'),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(
                      parent: ClampingScrollPhysics(),
                    ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return LandinaSwitchListTile(
                        onTap: () {
                          setState(() {
                            snapshot.data[index].active =
                                !snapshot.data[index].active;
                            Config.client.updateLink(
                              snapshot.data[index].id,
                              "active",
                              snapshot.data[index].active.toString(),
                            );
                          });
                        },
                        onLongPress: () {
                          landinaModal(
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: ButtonBarSuper(
                                  lineSpacing: 15,
                                  wrapType: WrapType.balanced,
                                  wrapFit: WrapFit.divided,
                                  children: [
                                    LandinaTextButton(
                                      title: "مشاهده لینک",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LandinaTextButton(
                                      title: "ویرایش اطلاعات",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LandinaTextButton(
                                      title: "کپی کردن",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LandinaTextButton(
                                      title: "به اشتراک گذاری",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    LandinaTextButton(
                                      title: "حذف لینک",
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
                        leading: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: !context.isDarkMode
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      foregroundColor: Colors.black,
                                      child: const Icon(CupertinoIcons.link),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xffF1F1F1)
                                          .withOpacity(0.1),
                                    ),
                                  ),
                                  child: const AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      child: Icon(CupertinoIcons.link),
                                    ),
                                  ),
                                ),
                        ),
                        title: "${snapshot.data[index].name}",
                        subtitle: "${snapshot.data[index].address}",
                        subtitleFont: "Poppins",
                        active: snapshot.data[index].active,
                        onChanged: (value) => setState(
                          () {
                            snapshot.data[index].active = value;
                            Config.client.updateLink(
                              snapshot.data[index].id,
                              "active",
                              value.toString(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  snapshot.data.length < 10
                      ? Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  "دیگه بیشتر از این اینجا نیست!",
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
                          ),
                        )
                      : Container(),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else {
              return Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/not_found.svg",
                        color:
                            !context.isDarkMode ? Colors.black : Colors.white,
                        width: 250,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "هنوز هیچ لینکی اینجا نیست!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color:
                              !context.isDarkMode ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 0.5,
                        color: !context.isDarkMode
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    leading: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CircleAvatar(
                        backgroundColor: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                        foregroundColor: Color(0xff3B3B3B),
                      ),
                    ),
                    focusColor: !context.isDarkMode
                        ? Colors.black.withOpacity(0.05)
                        : Colors.white.withOpacity(0.05),
                    title: Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                    subtitle: Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                    trailing: Container(
                      width: 40,
                      height: 25,
                      decoration: BoxDecoration(
                        color: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: LandinaIconButton(
                icon: Ionicons.reload,
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => super.widget),
                  );
                },
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 0.5,
                        color: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    leading: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CircleAvatar(
                        backgroundColor: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                        foregroundColor: Color(0xff3B3B3B),
                      ),
                    ),
                    focusColor: !context.isDarkMode
                        ? Colors.black.withOpacity(0.05)
                        : Colors.white.withOpacity(0.05),
                    title: Container(
                      width: 100,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                    subtitle: Container(
                      width: 150,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: !context.isDarkMode
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
