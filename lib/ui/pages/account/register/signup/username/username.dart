import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/pages/account/register/signup/signup.get.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/ui/pages/account/register/signup/password/password.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';
import 'package:get/get.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

// Internationalization and localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  bool? isLoading = false;

  final signUpGet = SignUpGet();

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
            title: 'نام کاربری',
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {
              landinaModal(Text("data"), context);
            },
            leftIcon: IconlyLight.arrow_left,
            leftIconOnPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            width: 325,
            constraints: const BoxConstraints(
              maxWidth: 325,
              minWidth: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppLocalizations.of(context)!.emailPageDescription,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextField(
                    maxLines: 1,
                    hintText: AppLocalizations.of(context)!.username,
                    suffixIcon: IconlyLight.info_circle,
                    textfieldController: Config.usernameController,
                    onChanged: (newValue) =>
                        signUpGet.username.value = newValue,
                    suffixIconOnPressed: () {
                      landinaModal(
                          Text(
                            AppLocalizations.of(context)!.username,
                          ),
                          context);
                    },
                    prefixIcon: IconlyLight.user,
                    prefixIconOnPressed: () {},
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextButton(
                    title: AppLocalizations.of(context)!.goToTheNextLevel,
                    isLoading: isLoading,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      Get.toNamed("/signUp/email");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
