import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/textfield/simple.textfield.dart';

class RoomChatPage extends StatefulWidget {
  const RoomChatPage({super.key});

  @override
  State<RoomChatPage> createState() => _RoomChatPageState();
}

class _RoomChatPageState extends State<RoomChatPage> {
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
            title: 'روم چت',
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {},
            leftIcon: IconlyLight.arrow_left,
            leftIconOnPressed: () {
              Get.back();
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
                  color: !context.isDarkMode ? Colors.black : Colors.white,
                  width: 250,
                ),
                const SizedBox(height: 25),
                Text(
                  "هنوز هیچ پیامی اینجا ندادی!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: !context.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: !context.isDarkMode ? Colors.white : Colors.black,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: !context.isDarkMode
                      ? const Color(0xffF1F1F1).withOpacity(0.5)
                      : const Color(0xffF1F1F1).withOpacity(0.1),
                ),
              ),
            ),
            child: LandinaTextField(
              hintText: "چه نظری درباره این کوپن داری؟",
              minLines: 1,
              maxLines: 3,
              prefixIcon: IconlyLight.info_circle,
              suffixIcon: Ionicons.prism_outline,
            ),
          ),
        ),
      ),
    );
  }
}
