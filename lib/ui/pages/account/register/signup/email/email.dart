import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
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

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  bool? isLoading = false;
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
            title: AppLocalizations.of(context)!.emailAddress,
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
                    textfieldController: Config.emailController,
                    maxLines: 1,
                    hintText: AppLocalizations.of(context)!.emailAddress,
                    suffixIcon: IconlyLight.info_circle,
                    suffixIconOnPressed: () {
                      landinaModal(Text("data"), context);
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
                      Get.toNamed("/signUp/password");
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
