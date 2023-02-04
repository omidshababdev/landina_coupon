import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';

import 'package:get/get.dart';

// String Extension for Capitalize

import 'package:landina_coupon/ui/widgets/textfield/simple.textfield.dart';

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

  bool? isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: LandinaAppbar(
            title: 'افزودن کوپن جدید',
            titleOnTap: () {},
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {},
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
            parent: ClampingScrollPhysics(),
          ),
          children: [
            ButtonBarSuper(
              lineSpacing: 15,
              wrapType: WrapType.balanced,
              wrapFit: WrapFit.proportional,
              children: [
                LandinaTextField(
                  hintText: 'عنوان کوپن',
                  minLines: 1,
                  maxLines: 3,
                  suffixIcon: IconlyLight.info_circle,
                  suffixIconOnPressed: () {},
                  prefixIcon: IconlyLight.paper,
                  prefixIconOnPressed: () {},
                  textfieldController: nameController,
                ),
                LandinaTextField(
                  hintText: 'کد کوپن',
                  maxLines: 1,
                  suffixIcon: IconlyLight.info_circle,
                  suffixIconOnPressed: () {},
                  prefixIcon: IconlyLight.paper,
                  prefixIconOnPressed: () {},
                  textfieldController: codeController,
                ),
                LandinaTextField(
                  hintText: 'دسته بندی',
                  maxLines: 1,
                  suffixIcon: IconlyLight.info_circle,
                  suffixIconOnPressed: () {},
                  prefixIcon: IconlyLight.paper,
                  prefixIconOnPressed: () {},
                  textfieldController: categoryController,
                ),
                LandinaTextField(
                  hintText: 'توضیحات',
                  minLines: 1,
                  suffixIcon: IconlyLight.info_circle,
                  suffixIconOnPressed: () {},
                  prefixIcon: IconlyLight.paper,
                  prefixIconOnPressed: () {},
                  textfieldController: descController,
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: !context.isDarkMode ? Colors.white : Colors.black,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: !context.isDarkMode
                      ? const Color(0xffF1F1F1).withOpacity(0.5)
                      : const Color(0xffF1F1F1).withOpacity(0.1),
                ),
              ),
            ),
            child: LandinaTextButton(
              title: 'ایجاد کوپن جدید',
              backgroundColor: true,
              isLoading: isLoading,
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 5), () {
                  setState(() {
                    isLoading = false;
                    Navigator.pop(context);
                  });
                });
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
