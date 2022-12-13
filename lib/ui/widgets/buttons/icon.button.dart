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
    return Container(
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(10, 0, 0, 0),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: const Color(0xff3b3b3b).withOpacity(0.5),
        ),
      ),
    );
  }
}
