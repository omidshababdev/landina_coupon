import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandinaTextField extends StatefulWidget {
  String? hintText;
  IconData? suffixIcon;
  VoidCallback? suffixIconOnPressed;
  IconData? prefixIcon;
  VoidCallback? prefixIconOnPressed;
  bool? obscureText;
  TextEditingController? textfieldController;
  int? minLines = 1;
  int? maxLines = 1;
  bool? enabled;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  LandinaTextField({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.prefixIcon,
    this.prefixIconOnPressed,
    this.obscureText,
    this.textfieldController,
    this.minLines,
    this.maxLines,
    this.enabled,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<LandinaTextField> createState() => _LandinaTextFieldState();
}

class _LandinaTextFieldState extends State<LandinaTextField> {
  VoidCallback rebuildOnLocaleChange() => () => setState(() {});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = window.locale;
    PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: !context.isDarkMode
              ? const Color(0xffF1F1F1).withOpacity(0.5)
              : const Color(0xffF1F1F1).withOpacity(0.1),
        ),
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
      child: TextField(
        controller: widget.textfieldController,
        onChanged: widget.onChanged != null
            ? (newValue) => widget.onChanged!(newValue)
            : null,
        style: const TextStyle(fontSize: 15),
        cursorColor: const Color(0xff3B3B3B),
        obscureText: widget.obscureText ?? false,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintStyle: TextStyle(
            fontSize: 15,
            height: 2,
            color: !context.isDarkMode
                ? Colors.black.withOpacity(0.5)
                : Colors.white.withOpacity(0.5),
          ),
          focusColor: Colors.black,
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: widget.prefixIconOnPressed,
            icon: Icon(
              widget.prefixIcon,
              color: !context.isDarkMode
                  ? Colors.black.withOpacity(0.5)
                  : Colors.white.withOpacity(0.5),
            ),
          ),
          suffixIcon: Container(
            decoration: BoxDecoration(
              border: myLocale.languageCode == "en"
                  ? Border(
                      left: BorderSide(
                        width: 1,
                        color: !context.isDarkMode
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
                      ),
                    )
                  : Border(
                      right: BorderSide(
                        width: 1,
                        color: !context.isDarkMode
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
                      ),
                    ),
            ),
            child: IconButton(
              onPressed: widget.suffixIconOnPressed,
              icon: Icon(
                widget.suffixIcon,
                color: !context.isDarkMode
                    ? Colors.black.withOpacity(0.5)
                    : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
