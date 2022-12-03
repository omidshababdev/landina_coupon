import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class LandinaTextButton extends StatelessWidget {
  final String title;
  bool? backgroundColor = true;
  final VoidCallback onPressed;
  LandinaTextButton({
    Key? key,
    required this.title,
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
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: backgroundColor == true
              ? const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )
              : const TextStyle(
                  color: Color(0xff3B3B3B),
                  fontWeight: FontWeight.w600,
                ),
        ),
      ),
    );
  }
}
