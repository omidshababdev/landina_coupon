import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/pages/account/register/signup/signup.get.dart';
import 'package:landina_coupon/ui/widgets/modals/modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

// Internationalization and localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final signUpGet = SignUpGet();

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
            title: AppLocalizations.of(context)!.password,
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
                    AppLocalizations.of(context)!.passPageDescription,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextField(
                    onChanged: (newValue) =>
                        signUpGet.password.value = newValue,
                    maxLines: 1,
                    hintText: AppLocalizations.of(context)!.password,
                    suffixIcon: signUpGet.passwordVisible.value == false
                        ? IconlyLight.show
                        : IconlyLight.hide,
                    suffixIconOnPressed: () {
                      setState(() {
                        signUpGet.passwordVisible.value =
                            !signUpGet.passwordVisible.value;
                      });
                    },
                    prefixIcon: IconlyLight.password,
                    prefixIconOnPressed: () {},
                    obscureText: !signUpGet.passwordVisible.value,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(
                    () => LandinaTextButton(
                      title: AppLocalizations.of(context)!.goToTheNextLevel,
                      isLoading: signUpGet.isLoading.value,
                      onPressed: () {
                        signUpGet.createAccount();
                      },
                    ),
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
