import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
      body: Center(
        child: Container(
          width: 325,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        ),
      ),
    );
  }
}
