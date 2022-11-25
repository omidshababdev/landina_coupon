import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class LandinaListTile extends StatelessWidget {
  final String title;
  IconData? leadingIcon;
  IconData? trailingIcon;
  VoidCallback? leadingIconOnPressed;
  VoidCallback? trailingIconOnPressed;

  LandinaListTile({
    Key? key,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconOnPressed,
    this.trailingIconOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xffF1F1F1)),
        borderRadius: const SmoothBorderRadius.only(
          topLeft: SmoothRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
          topRight: SmoothRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
          bottomLeft: SmoothRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
          bottomRight: SmoothRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
        ),
      ),
      child: ListTile(
        minLeadingWidth: 0,
        leading: Container(
          width: 30,
          child: IconButton(
            onPressed: leadingIconOnPressed,
            icon: Icon(
              leadingIcon,
              color: const Color(0xff3b3b3b).withOpacity(0.5),
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        trailing: IconButton(
          onPressed: trailingIconOnPressed,
          icon: Icon(
            trailingIcon,
            color: const Color(0xff3b3b3b).withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
