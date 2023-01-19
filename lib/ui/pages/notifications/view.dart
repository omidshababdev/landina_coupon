import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/colors.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/simple.listtile.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';

class NotificationsPage extends StatefulWidget {
  Future? userInfo;

  NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    widget.userInfo = Config.client.getUserNotif(Config.box.read("myId"));
    reload();
  }

  Future<void> reload() async {
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "اعلان ها",
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
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                key: const PageStorageKey<String>('notifications'),
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
                          color: borderColor,
                        ),
                      ),
                    ),
                    child: LandinaSimpleListTile(
                      onTap: () {
                        setState(() {});
                      },
                      leading: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CircleAvatar(
                          backgroundColor: Config.darkMode != true
                              ? Colors.black.withOpacity(0.05)
                              : Colors.white.withOpacity(0.05),
                          foregroundColor: const Color(0xff3B3B3B),
                          child: Icon(
                            IconlyLight.notification,
                            color: Config.darkMode != true
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                      title: "${snapshot.data[index].title}",
                      subtitle: "${snapshot.data[index].body}",
                    ),
                  );
                },
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/not_found.svg",
                      color:
                          Config.darkMode != true ? Colors.black : Colors.white,
                      width: 250,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "هنوز هیچ اعلانی اینجا نیست!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Config.darkMode != true
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
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
                      width: 40,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Config.darkMode != true
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
