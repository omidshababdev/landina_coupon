import 'package:flutter/material.dart';
import 'package:landina_coupon/ui/components/coupon/coupon.dart';

class CategoriesBox extends StatelessWidget {
  const CategoriesBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const PageStorageKey<String>('CategoriesBox'),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        spacing: 8,
        children: [
          ...List.generate(
            8,
            (index) => const Coupon(
              userId: "",
              title: "عنوان تخفیف موجود",
              description:
                  "توضیحات کوپن که اینجا قرار میگیره میگه قرار جیکار کنه!",
              couponCode: "couponCode",
            ),
          ),
        ],
      ),
    );
  }
}
