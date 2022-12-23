import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LandinaListTile extends StatelessWidget {
  String? title;
  String? subtitle;
  VoidCallback? onTap;
  Widget? leading;

  LandinaListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.onTap,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        leading: AspectRatio(
          aspectRatio: 1 / 1,
          child: CircleAvatar(
            backgroundColor: const Color(0xffF1F1F1),
            foregroundColor: const Color(0xff3B3B3B),
            child: leading,
          ),
        ),
        focusColor: const Color(0xfff1f1f1),
        title: Text(
          "$title",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xff3B3B3B),
          ),
        ),
        subtitle: Text(
          "$subtitle",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
