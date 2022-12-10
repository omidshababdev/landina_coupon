import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/ui/components/modals/about.modal.dart';
import 'package:landina_coupon/ui/components/modals/email_username.modal.dart';

import 'package:landina_coupon/ui/pages/account/login/forget/forget.dart';
import 'package:landina_coupon/ui/pages/account/profile/profile.dart';
import 'package:landina_coupon/ui/pages/account/register/email/email.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? _passwordVisible;

  TextEditingController emailUsernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
            title: AppLocalizations.of(context)!.loginToAccount,
            rightIcon: IconlyLight.info_circle,
            rightIconOnPressed: () {
              aboutModal(context);
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
                    AppLocalizations.of(context)!.loginPageDescription,
                    style: const TextStyle(
                      height: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextField(
                    hintText: AppLocalizations.of(context)!.landinaID,
                    suffixIcon: IconlyLight.info_circle,
                    suffixIconOnPressed: () {
                      emailUsernameModal(context);
                    },
                    prefixIcon: IconlyLight.user,
                    prefixIconOnPressed: () {},
                    obscureText: false,
                    textfieldController: emailUsernameController,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextField(
                    hintText: AppLocalizations.of(context)!.password,
                    suffixIcon: _passwordVisible == false
                        ? IconlyLight.show
                        : IconlyLight.hide,
                    suffixIconOnPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible!;
                      });
                    },
                    prefixIcon: IconlyLight.password,
                    prefixIconOnPressed: () {},
                    obscureText: !_passwordVisible!,
                    textfieldController: passwordController,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: LandinaTextButton(
                    title: AppLocalizations.of(context)!.loginToAccount,
                    onPressed: () async {
                      Get.offNamed("/profile");
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ForgetPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPass,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3B3B3B),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 15,
                        decoration: BoxDecoration(
                          color: const Color(0xff3B3B3B).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const EmailPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.createAnAccount,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3B3B3B),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
