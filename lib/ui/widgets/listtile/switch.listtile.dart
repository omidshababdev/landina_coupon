import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandinaSwitchListTile extends StatelessWidget {
  String? title;
  String? subtitle;
  String? subtitleFont;
  VoidCallback? onTap;
  VoidCallback? onLongPress;
  Widget? leading;
  bool active = false;
  Function(bool)? onChanged;

  LandinaSwitchListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.subtitleFont,
    this.onTap,
    this.onLongPress,
    this.leading,
    required this.active,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        onTap: onTap,
        onLongPress: onLongPress,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        leading: leading,
        focusColor: const Color(0xfff1f1f1),
        title: Text(
          "$title",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: !context.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        subtitle: Text(
          "$subtitle",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontFamily: subtitleFont,
            color: !context.isDarkMode
                ? Colors.black.withOpacity(0.5)
                : Colors.white.withOpacity(0.5),
            fontSize: 13,
          ),
        ),
        trailing: Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
            value: active,
            activeColor: const Color(0xff3B3B3B),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
