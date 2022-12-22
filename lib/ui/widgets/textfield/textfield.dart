import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

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
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.textfieldController,
          style: const TextStyle(fontSize: 15),
          cursorColor: const Color(0xff3B3B3B),
          obscureText: widget.obscureText ?? false,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            hintStyle: const TextStyle(
              fontSize: 15,
              height: 2,
            ),
            focusColor: Colors.black,
            border: InputBorder.none,
            prefixIcon: IconButton(
              onPressed: widget.prefixIconOnPressed,
              icon: Icon(
                widget.prefixIcon,
                color: const Color(0xff3b3b3b).withOpacity(0.5),
              ),
            ),
            suffixIcon: Container(
              decoration: BoxDecoration(
                border: myLocale.languageCode == "en"
                    ? const Border(
                        left: BorderSide(
                          width: 1,
                          color: Color(0xffF1F1F1),
                        ),
                      )
                    : const Border(
                        right: BorderSide(
                          width: 1,
                          color: Color(0xffF1F1F1),
                        ),
                      ),
              ),
              child: IconButton(
                onPressed: widget.suffixIconOnPressed,
                icon: Icon(
                  widget.suffixIcon,
                  color: const Color(0xff3b3b3b).withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
