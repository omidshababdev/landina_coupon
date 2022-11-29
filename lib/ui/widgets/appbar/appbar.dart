import 'package:flutter/material.dart';

class LandinaAppbar extends StatelessWidget {
  String? title;
  IconData? leftIcon;
  VoidCallback? leftIconOnPressed;
  IconData? rightIcon;
  VoidCallback? rightIconOnPressed;

  LandinaAppbar(
      {super.key,
      this.title,
      this.leftIcon,
      this.rightIcon,
      this.leftIconOnPressed,
      this.rightIconOnPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 66,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(10, 0, 0, 0),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: Icon(
              rightIcon,
              color: const Color.fromARGB(255, 51, 51, 51),
            ),
            onPressed: rightIconOnPressed,
            hoverColor: Colors.transparent,
          ),
        ),
      ),
      title: Text(
        title!,
        style: const TextStyle(
          color: Color.fromARGB(255, 51, 51, 51),
          fontSize: 18,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(10, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: Icon(
                leftIcon,
                color: const Color.fromARGB(255, 51, 51, 51),
              ),
              onPressed: leftIconOnPressed,
              hoverColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
