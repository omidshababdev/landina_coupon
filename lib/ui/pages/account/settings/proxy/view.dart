import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/button.listtile.dart';
import 'package:landina_coupon/ui/widgets/modals/simple.modal.dart';

class ProxyPage extends StatefulWidget {
  const ProxyPage({super.key});

  @override
  State<ProxyPage> createState() => _ProxyPageState();
}

class _ProxyPageState extends State<ProxyPage> {
  bool proxyMode = false;

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
            title: 'پروکسی',
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
                              title: "افزودن پروکسی جدید",
                              onPressed: () {
                                Navigator.pop(context);
                                Get.toNamed("/settings");
                              },
                            ),
                            LandinaTextButton(
                              title: "جستجوی پروکسی",
                              onPressed: () {},
                            ),
                            LandinaTextButton(
                              title: "حذف کردن همه پروکسی ها",
                              backgroundColor: true,
                              onPressed: () {
                                Navigator.pop(context);

                                Get.back();
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
          future: null,
          builder: (context, snapshot) {
            final userInfo = snapshot.data;

            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListView.builder(
                      key: PageStorageKey<String>('{$userInfo.name}followers'),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                        parent: ClampingScrollPhysics(),
                      ),
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return LandinaButtonListTile(
                          onTap: () {
                            //
                          },
                          leading: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CircleAvatar(
                              backgroundColor: !context.isDarkMode
                                  ? Colors.black.withOpacity(0.05)
                                  : Colors.white.withOpacity(0.05),
                              foregroundColor: Color(0xff3B3B3B),
                            ),
                          ),
                          title: "عنوان بک آپ",
                          subtitle: "تاریخ و اطلاعات بک آپ",
                          buttonTitle: "دانلود کردن",
                          buttonColor: true,
                          buttonOnPressed: () {},
                        );
                      },
                    ),
                    // snapshot.data.length < 10
                    //     ? Center(
                    //         child: Container(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 25, vertical: 50),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               SvgPicture.asset(
                    //                 "assets/svg/not_found.svg",
                    //                 color: !context.isDarkMode
                    //                     ? Colors.black
                    //                     : Colors.white,
                    //                 width: 250,
                    //               ),
                    //               const SizedBox(height: 25),
                    //               Text(
                    //                 "دیگه بیشتر از این اینجا نیست!",
                    //                 style: TextStyle(
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w500,
                    //                   color: !context.isDarkMode
                    //                       ? Colors.black
                    //                       : Colors.white,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     : Container(),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/not_found.svg",
                          color:
                              !context.isDarkMode ? Colors.black : Colors.white,
                          width: 250,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "هنوز هیچ کسی اینجا نیست!",
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
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: !context.isDarkMode
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
