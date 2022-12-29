import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/listtile/listtile.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      widget.userInfo = Config.client.getUser(Config.box.read("myId"));
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
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.separated(
                key: const PageStorageKey<String>('home'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                itemCount: 1,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return LandinaListTile(
                    title: "$user.links",
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else {
              return Container(
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
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
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
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
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
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
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
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
            );
          }
        },
      ),
    );
  }
}
