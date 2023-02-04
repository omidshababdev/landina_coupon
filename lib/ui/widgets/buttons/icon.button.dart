import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandinaIconButton extends StatelessWidget {
  final IconData icon;
  late VoidCallback onPressed;
  LandinaIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: !context.isDarkMode
              ? const Color(0xffF1F1F1).withOpacity(0.5)
              : const Color(0xffF1F1F1).withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: !context.isDarkMode ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
