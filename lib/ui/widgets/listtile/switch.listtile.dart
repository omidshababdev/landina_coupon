import 'package:flutter/material.dart';
import 'package:landina_coupon/constants/config.dart';

class LandinaSwitchListTile extends StatefulWidget {
  String? title;
  String? subtitle;
  VoidCallback? onTap;
  Widget? leading;

  LandinaSwitchListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.onTap,
    this.leading,
  }) : super(key: key);

  @override
  State<LandinaSwitchListTile> createState() => _LandinaSwitchListTileState();
}

class _LandinaSwitchListTileState extends State<LandinaSwitchListTile> {
  @override
  Widget build(BuildContext context) {
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
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        leading: Config.darkMode != true
            ? AspectRatio(
                aspectRatio: 1 / 1,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  foregroundColor: Colors.black,
                  child: widget.leading,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1,
                    color: Config.darkMode != true
                        ? const Color(0xffF1F1F1).withOpacity(0.5)
                        : const Color(0xffF1F1F1).withOpacity(0.1),
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: widget.leading,
                  ),
                ),
              ),
        focusColor: const Color(0xfff1f1f1),
        title: Text(
          "${widget.title}",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xff3B3B3B),
          ),
        ),
        subtitle: Text(
          "${widget.subtitle}",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
