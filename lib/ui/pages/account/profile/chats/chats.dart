import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/listtile.dart';

class ChatsPage extends StatefulWidget {
  Future? userInfo;
  ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ChatsPage> {
  @override
  void initState() {
    super.initState();

    widget.userInfo = Config.client.getUserFollowers(Config.box.read("myId"));
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
            title: 'پیام ها',
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {},
            leftIcon: IconlyLight.arrow_left,
            leftIconOnPressed: () {
              Get.back();
            },
          ),
        ),
        body: FutureBuilder(
          future: widget.userInfo,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView(
                  key: const PageStorageKey<String>('chats'),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                        parent: ClampingScrollPhysics(),
                      ),
                      itemCount: snapshot.data.length,
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
                            leading: !context.isDarkMode
                                ? AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.1),
                                      foregroundColor: Colors.black,
                                      child: const Icon(
                                        IconlyLight.profile,
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        width: 1,
                                        color: !context.isDarkMode
                                            ? const Color(0xffF1F1F1)
                                                .withOpacity(0.5)
                                            : const Color(0xffF1F1F1)
                                                .withOpacity(0.1),
                                      ),
                                    ),
                                    child: const AspectRatio(
                                      aspectRatio: 1 / 1,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: Colors.white,
                                        child: Icon(
                                          IconlyLight.profile,
                                        ),
                                      ),
                                    ),
                                  ),
                            focusColor: const Color(0xfff1f1f1),
                            title: Text(
                              "${snapshot.data[index].name}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: !context.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              "${snapshot.data[index].bio}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: !context.isDarkMode
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.white.withOpacity(0.5),
                                fontSize: 13,
                              ),
                            ),
                            onTap: () {
                              Get.toNamed("/chats/single");
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
                return Center(
                  child: Container(
                    width: 325,
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
                          "هنوز هیچ پیامی اینجا نیست!",
                          textAlign: TextAlign.center,
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
      ),
    );
  }
}
