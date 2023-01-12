import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

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
            title: AppLocalizations.of(context)!.forgetPass.capitalize(),
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {},
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
                    AppLocalizations.of(context)!.forgetPassPageDescription,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextField(
                    hintText:
                        AppLocalizations.of(context)!.emailAddress.capitalize(),
                    suffixIcon: IconlyLight.info_circle,
                    suffixIconOnPressed: () {},
                    prefixIcon: IconlyLight.user,
                    prefixIconOnPressed: () {},
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextButton(
                    title: AppLocalizations.of(context)!.sendRecoveryEmail,
                    onPressed: () {},
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
