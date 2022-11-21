import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "لندینا کوپن",
          rightIcon: IconlyLight.activity,
          leftIcon: IconlyLight.paper,
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
            child: LandinaTextField(
              hintText: "دنبال چه کوپنی هستی؟",
              prefixIcon: IconlyLight.search,
              prefixIconOnPressed: () {},
              suffixIcon: IconlyLight.filter,
              suffixIconOnPressed: () {
                landinaModal(context);
              },
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'ای وای! قبلا دنبال چیزی نبودی. ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
