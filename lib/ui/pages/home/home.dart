import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/components/coupon/coupon.dart';
import 'package:landina_coupon/ui/pages/categories/categories.dart';
import 'package:landina_coupon/ui/pages/profile/profile.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/components/modals/login.modal.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool loggedIn = false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "لندینا کوپن",
          rightIcon: IconlyLight.category,
          rightIconOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CategoriesPage();
                },
              ),
            );
          },
          leftIcon: IconlyLight.profile,
          leftIconOnPressed: () {
            loggedIn == false
                ? loginModal(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 1,
                  color: Color(0xffF1F1F1),
                ),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: LandinaTextField(
                hintText: "دنبال چه کوپنی هستی؟",
                prefixIcon: IconlyLight.search,
                prefixIconOnPressed: () {},
                suffixIcon: IconlyLight.filter,
                suffixIconOnPressed: () {
                  loginModal(context);
                },
                obscureText: false,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              key: const PageStorageKey<String>('home'),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Coupon(
                  title: "عنوان تخفیف موجود",
                  brand: "نام برند",
                  description:
                      "لورم ایپسوم متنی ساختگی با محتوایی نامفهوم از صنعت چاپ برای روزی روزگاری است که در این وادی می چرخد!",
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
            ),
          ),
        ],
      ),
    );
  }
}
