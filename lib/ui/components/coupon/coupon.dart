import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Coupon extends StatelessWidget {
  final String title;
  final String brand;
  final String description;
  const Coupon(
      {super.key,
      required this.title,
      required this.brand,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onLongPress: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 10,
              cornerSmoothing: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              leading: Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: const Color(0xffF1F1F1),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 1,
                    ),
                  ),
                ),
              ),
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                brand,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.recordingtape),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 2,
                color: const Color(0xff3B3B3B).withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 30),
            Container(
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
                onPressed: () {},
                child: const Text(
                  "کپی کردن کد تخفیف",
                  style: TextStyle(
                    color: Color(0xff3B3B3B),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
