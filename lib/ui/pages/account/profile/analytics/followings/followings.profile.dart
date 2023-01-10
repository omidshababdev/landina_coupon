import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/pages/account/account.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/listtile.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';

class FollowingsPage extends StatefulWidget {
  Future? userInfo;
  bool isFollowed = true;

  FollowingsPage({super.key});

  @override
  State<FollowingsPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<FollowingsPage> {
  bool isFollowed = true;
  @override
  void initState() {
    super.initState();

    setState(() {
      widget.userInfo =
          Config.client.getUserFollowings(Config.box.read("myId"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "دنبال شونده ها",
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
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 0.5,
                          color: Color(0xffF1F1F1),
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AccountPage(user: userInfo[index]),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      leading: const AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffF1F1F1),
                          foregroundColor: Color(0xff3B3B3B),
                        ),
                      ),
                      focusColor: const Color(0xfff1f1f1),
                      title: Text(
                        "${snapshot.data[index].name}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3B3B3B),
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data[index].username}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 13,
                        ),
                      ),
                      trailing: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: LandinaTextButton(
                          title: isFollowed != true
                              ? AppLocalizations.of(context)!
                                  .follow
                                  .capitalize()
                              : "${AppLocalizations.of(context)!.follow.capitalize()}ed",
                          backgroundColor: isFollowed != true ? true : false,
                          onPressed: () {
                            setState(() {
                              isFollowed != true
                                  ? isFollowed = !isFollowed
                                  : landinaModal(
                                      LandinaTextButton(
                                        title:
                                            "Un${AppLocalizations.of(context)!.follow}",
                                        onPressed: () {
                                          setState(() {
                                            isFollowed = !isFollowed;
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                      context);
                            });
                          },
                        ),
                      ),
                    ),
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
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 0.5,
                        color: Color(0xffF1F1F1),
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    leading: const AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffF1F1F1),
                        foregroundColor: Color(0xff3B3B3B),
                      ),
                    ),
                    focusColor: const Color(0xfff1f1f1),
                    title: Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffF1F1F1),
                      ),
                    ),
                    subtitle: Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffF1F1F1),
                      ),
                    ),
                    trailing: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F1F1),
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
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 0.5,
                        color: Color(0xffF1F1F1),
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    leading: const AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffF1F1F1),
                        foregroundColor: Color(0xff3B3B3B),
                      ),
                    ),
                    focusColor: const Color(0xfff1f1f1),
                    title: Container(
                      width: 100,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffF1F1F1),
                      ),
                    ),
                    subtitle: Container(
                      width: 150,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffF1F1F1),
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
