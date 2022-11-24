import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/widgets/button/text.button.dart';

void forgetModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: false,
    builder: (context) {
      return Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: SmoothBorderRadius.only(
                topLeft: SmoothRadius(
                  cornerRadius: 30,
                  cornerSmoothing: 2,
                ),
                topRight: SmoothRadius(
                  cornerRadius: 30,
                  cornerSmoothing: 2,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "راهنمای فیلد ایمیل بازیابی",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "توی این قسمت فقط کافیه ایمیلی که باهاش ثبت نام کردی رو وارد کنی تا لینک بازیابی برات ارسال بشه. بعد با باز کردن لینک می تونی رمز جدید برای خودت تعریف کنی.",
                  style: TextStyle(
                    fontSize: 13,
                    color: const Color(0xff3B3B3B).withOpacity(0.5),
                    height: 2,
                  ),
                ),
                const SizedBox(height: 30),
                LandinaTextButton(
                  title: "متوجه شدم باید چیکار کنم",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
