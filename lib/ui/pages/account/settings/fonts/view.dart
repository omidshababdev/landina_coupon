import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

class FontsPage extends StatefulWidget {
  const FontsPage({super.key});

  @override
  State<FontsPage> createState() => _FontsPageState();
}

class _FontsPageState extends State<FontsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "فونت ها",
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
              Image.asset(
                "assets/images/hand_shake.png",
                width: 250,
              ),
              const SizedBox(height: 25),
              Text(
                "بهت قول میدیم بزودی این صفحه رو میسازیم!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff3B3B3B).withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
