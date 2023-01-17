import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/pages/account/view.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/button.listtile.dart';
import 'package:landina_coupon/ui/widgets/listtile/simple.listtile.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';

class FollowersPage extends StatefulWidget {
  Future? userInfo;

  FollowersPage({super.key});

  @override
  State<FollowersPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<FollowersPage> {
  @override
  void initState() {
    super.initState();

    setState(() {
      widget.userInfo = Config.client.getUserFollowers(Config.box.read("myId"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "دنبال کننده ها",
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
          final userInfo = snapshot.data;

          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                key: PageStorageKey<String>('{$userInfo.name}followers'),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final isFollowed = List.filled(
                      snapshot.data.length,
                      Config.client.getFollowedUser(Config.box.read("myId"),
                          snapshot.data[index]!.id.toString()));

                  print(isFollowed.runtimeType);

                  return LandinaButtonListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AccountPage(user: userInfo[index]),
                        ),
                      );
                    },
                    leading: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CircleAvatar(
                        backgroundColor: Config.darkMode != true
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                        foregroundColor: Color(0xff3B3B3B),
                      ),
                    ),
                    title: snapshot.data[index].name,
                    subtitle: snapshot.data[index].username,
                    buttonTitle: isFollowed[index] != true
                        ? AppLocalizations.of(context)!.follow.capitalize()
                        : "${AppLocalizations.of(context)!.follow.capitalize()}ed",
                    buttonColor: isFollowed[index] != true ? true : false,
                    buttonOnPressed: () {
                      setState(() {
                        isFollowed[index] != Future.value(true)
                            ? {
                                Config.client.followUser(
                                    snapshot.data[index]!.id.toString()),
                                isFollowed[index] = Future.value(true),
                              }
                            : landinaModal(
                                LandinaTextButton(
                                  title:
                                      "Un${AppLocalizations.of(context)!.follow}",
                                  onPressed: () {
                                    setState(() {
                                      Config.client.unfollowUser(
                                          snapshot.data[index]!.id.toString());
                                      isFollowed[index] = Future.value(true);
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                                context);
                      });
                    },
                  );
                },
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
                    children: [
                      Image.asset(
                        "assets/images/not_found.png",
                        width: 250,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "هنوز هیچ کسی اینجا نیست!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff3B3B3B).withOpacity(0.9),
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
                        color: Config.darkMode != true
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
                        backgroundColor: Config.darkMode != true
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                        foregroundColor: Color(0xff3B3B3B),
                      ),
                    ),
                    focusColor: Config.darkMode != true
                        ? Colors.black.withOpacity(0.05)
                        : Colors.white.withOpacity(0.05),
                    title: Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Config.darkMode != true
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                    subtitle: Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Config.darkMode != true
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                    trailing: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Config.darkMode != true
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
                        color: Config.darkMode != true
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
                        backgroundColor: Config.darkMode != true
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                        foregroundColor: Color(0xff3B3B3B),
                      ),
                    ),
                    focusColor: Config.darkMode != true
                        ? Colors.black.withOpacity(0.05)
                        : Colors.white.withOpacity(0.05),
                    title: Container(
                      width: 100,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Config.darkMode != true
                            ? Colors.black.withOpacity(0.05)
                            : Colors.white.withOpacity(0.05),
                      ),
                    ),
                    subtitle: Container(
                      width: 150,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Config.darkMode != true
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
