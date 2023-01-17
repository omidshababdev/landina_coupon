import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/services/notification.services.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();

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
      body: ListView(
        key: const PageStorageKey<String>('notifications'),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        children: [
          Config.isNotifAllowed() != true
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      const Text(
                        "بهم اجازه ارسال نوتیفیکیشن رو میدی؟",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "قول میدم اذیتت نکنم! فقط اعلان های واجب رو برات ارسال می کنم تا حواست پرت نشه!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ButtonBarSuper(
                        lineSpacing: 15,
                        wrapType: WrapType.balanced,
                        wrapFit: WrapFit.proportional,
                        children: [
                          LandinaTextButton(
                            title: "بله حتما",
                            backgroundColor: true,
                            onPressed: () async {
                              AwesomeNotifications()
                                  .requestPermissionToSendNotifications()
                                  .then(
                                    (_) => Config.setNotifAllowed(true),
                                  );
                            },
                          ),
                          LandinaTextButton(
                            title: "نه اصلا",
                            onPressed: () {
                              Config.setNotifAllowed(false).then(
                                (_) => reload(),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : Container(),
          const SizedBox(height: 25),
          SvgPicture.asset(
            "assets/svg/not_found.svg",
            color: Config.darkMode != true ? Colors.black : Colors.white,
            width: 250,
          ),
          const SizedBox(height: 25),
          Text(
            "هنوز هیچ اعلانی اینجا نداری!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Config.darkMode != true ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
