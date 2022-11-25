import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class LandinaTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const LandinaTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: ShapeDecoration(
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
          style: const TextStyle(
            color: Color(0xff3B3B3B),
          ),
        ),
      ),
    );
  }
}