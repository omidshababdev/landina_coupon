import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandinaTextButton extends StatelessWidget {
  final String title;
  bool? isLoading = true;
  bool? backgroundColor = false;
  VoidCallback? onPressed;
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
      decoration: !context.isDarkMode
          ? backgroundColor != true
              ? ShapeDecoration(
                  color: Colors.black.withOpacity(0.05),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                )
              : ShapeDecoration(
                  color: Colors.black,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                )
          : backgroundColor != true
              ? ShapeDecoration(
                  color: Colors.transparent,
                  shape: SmoothRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xffF1F1F1).withOpacity(0.1),
                    ),
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                )
              : ShapeDecoration(
                  color: Colors.white.withOpacity(0.08),
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
            ),
          ),
        ),
        child: isLoading != true
            ? Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: !context.isDarkMode
                      ? backgroundColor != true
                          ? Colors.black
                          : Colors.white
                      : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            : SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: !context.isDarkMode
                      ? backgroundColor != true
                          ? Colors.black.withOpacity(0.5)
                          : Colors.white
                      : Colors.white,
                  strokeWidth: 1,
                ),
              ),
      ),
    );
  }
}
