import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/constants/text.styles.dart';

class LandinaTextButton extends StatelessWidget {
  final String title;
  bool? isLoading = true;
  bool? backgroundColor = true;
  final VoidCallback onPressed;
  LandinaTextButton({
    Key? key,
    required this.title,
    this.isLoading,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: backgroundColor == true
          ? ShapeDecoration(
              color: const Color(0xff0F172A),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 10,
                  cornerSmoothing: 0.5,
                ),
              ),
            )
          : ShapeDecoration(
              color: const Color(0xffF1F1F1),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 10,
                  cornerSmoothing: 0.5,
                ),
              ),
            ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ))),
        child: isLoading == true
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: backgroundColor != true
                      ? const Color(0xff0F172A).withOpacity(0.5)
                      : Colors.white,
                  strokeWidth: 1,
                ),
              )
            : Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: backgroundColor == true
                    ? LandinaTextStyles.buttonWithBackground
                    : LandinaTextStyles.buttonWithBackground,
              ),
      ),
    );
  }
}
