import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/comment/comment.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/coupon/comments");
      },
      onLongPress: () {},
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Config.darkMode != true
              ? Colors.black.withOpacity(0.05)
              : Colors.white.withOpacity(0.05),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 20,
              cornerSmoothing: 0.5,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Wrap(
                spacing: 8,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/coupon/comments");
                    },
                    child: Wrap(
                      spacing: -15,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Config.darkMode != true
                                ? Colors.black.withOpacity(0.05)
                                : Colors.white.withOpacity(0.05),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Config.darkMode != true
                                ? Colors.black.withOpacity(0.05)
                                : Colors.white.withOpacity(0.05),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Config.darkMode != true
                                ? Colors.black.withOpacity(0.05)
                                : Colors.white.withOpacity(0.05),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/coupon/comments");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 1,
                          color: Config.darkMode != true
                              ? const Color(0xffF1F1F1).withOpacity(0.5)
                              : const Color(0xffF1F1F1).withOpacity(0.1),
                        ),
                      ),
                      child: Wrap(
                        spacing: 5,
                        children: const [
                          Text(
                            "47,689",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "نظر گذاشتن",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Comment(),
            GestureDetector(
              onTap: () {
                Get.toNamed("/coupon/comments");
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: ShapeDecoration(
                  color: Config.darkMode != true
                      ? Colors.black.withOpacity(0.05)
                      : Colors.white.withOpacity(0.05),
                  shape: const SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius.only(
                      bottomLeft: SmoothRadius(
                        cornerRadius: 20,
                        cornerSmoothing: 0.5,
                      ),
                      bottomRight: SmoothRadius(
                        cornerRadius: 20,
                        cornerSmoothing: 0.5,
                      ),
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "مشاهده همه نظرات",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          Config.darkMode != true ? Colors.black : Colors.white,
                    ),
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
