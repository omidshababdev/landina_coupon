import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

class LandinaButtonListTile extends StatelessWidget {
  String? title;
  String? subtitle;
  VoidCallback? onTap;
  Widget? leading;

  String? buttonTitle;
  bool? buttonColor;
  VoidCallback? buttonOnPressed;

  LandinaButtonListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.onTap,
    this.leading,
    this.buttonTitle,
    this.buttonColor,
    this.buttonOnPressed,
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
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        leading: !context.isDarkMode
            ? AspectRatio(
                aspectRatio: 1 / 1,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  foregroundColor: Colors.black,
                  child: leading,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1,
                    color: !context.isDarkMode
                        ? const Color(0xffF1F1F1).withOpacity(0.5)
                        : const Color(0xffF1F1F1).withOpacity(0.1),
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: leading,
                  ),
                ),
              ),
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
            color: !context.isDarkMode
                ? Colors.black.withOpacity(0.5)
                : Colors.white.withOpacity(0.5),
            fontFamily: "Poppins",
            fontSize: 13,
          ),
        ),
        onTap: onTap,
        trailing: SizedBox(
          width: 100,
          height: 50,
          child: LandinaTextButton(
            title: "$buttonTitle",
            backgroundColor: buttonColor,
            onPressed: buttonOnPressed,
          ),
        ),
      ),
    );
  }
}
