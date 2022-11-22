import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class LandinaButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const LandinaButton({
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
            cornerSmoothing: 1,
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
