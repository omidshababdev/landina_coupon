import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/icon.button.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';

import 'package:get/get.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

class NewCouponPage extends StatefulWidget {
  const NewCouponPage({super.key});

  @override
  State<NewCouponPage> createState() => _NewCouponPageState();
}

class _NewCouponPageState extends State<NewCouponPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: LandinaAppbar(
            title: 'افزودن کوپن جدید',
            titleOnTap: () {
              landinaModal(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "حساب های من",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff3B3B3B).withOpacity(1),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "بزودی امکان ورود به چند حساب رو اضافه می کنیم. فعلا با همین حسابت حال کن :)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff3B3B3B).withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 15),
                    LandinaTextButton(
                      title: "خیلی خوب",
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {
              landinaModal(
                ButtonBarSuper(
                  lineSpacing: 15,
                  wrapType: WrapType.balanced,
                  wrapFit: WrapFit.divided,
                  children: [
                    LandinaTextButton(
                      title: "تنظیمات",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    LandinaTextButton(
                      title: "تماس با پشتیبانی",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    LandinaTextButton(
                      title: "اشتراک گذاری پروفایل",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    LandinaTextButton(
                      title: "می خوام از حسابم خارج بشم",
                      backgroundColor: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
            leftIcon: IconlyLight.arrow_left,
            leftIconOnPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          key: const PageStorageKey<String>('new'),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: LandinaTextField(
                hintText: 'عنوان کوپن',
                minLines: 1,
                maxLines: 3,
                suffixIcon: IconlyLight.info_circle,
                suffixIconOnPressed: () {},
                prefixIcon: IconlyLight.paper,
                prefixIconOnPressed: () {},
                textfieldController: nameController,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextField(
                    hintText: 'کد کوپن',
                    maxLines: 1,
                    suffixIcon: IconlyLight.info_circle,
                    suffixIconOnPressed: () {},
                    prefixIcon: IconlyLight.paper,
                    prefixIconOnPressed: () {},
                    textfieldController: codeController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextField(
                    hintText: 'دسته بندی',
                    maxLines: 1,
                    suffixIcon: IconlyLight.info_circle,
                    suffixIconOnPressed: () {},
                    prefixIcon: IconlyLight.paper,
                    prefixIconOnPressed: () {},
                    textfieldController: categoryController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: LandinaTextField(
                hintText: 'توضیحات',
                minLines: 1,
                suffixIcon: IconlyLight.info_circle,
                suffixIconOnPressed: () {},
                prefixIcon: IconlyLight.paper,
                prefixIconOnPressed: () {},
                textfieldController: descController,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: LandinaTextButton(
              title: 'ایجاد کوپن جدید',
              backgroundColor: true,
              onPressed: () async {
                await Config.client.createCoupon(
                  nameController.text,
                  codeController.text,
                  categoryController.text,
                  descController.text,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
