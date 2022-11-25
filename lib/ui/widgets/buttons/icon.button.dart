import 'package:flutter/material.dart';

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
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: const Color(0xff3b3b3b).withOpacity(0.5),
      ),
    );
  }
}
