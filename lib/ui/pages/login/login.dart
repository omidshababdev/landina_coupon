import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/ui/components/modals/login.modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:landina_coupon/ui/widgets/button/button.dart';
import 'package:landina_coupon/ui/widgets/textfield/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "ورود به حساب کاربری",
          rightIcon: IconlyLight.call,
          rightIconOnPressed: () {
            loginModal(context);
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
                child: const Text(
                  "لطفا برای ورود به حساب کاربری خود اطلاعات زیر را وارد کنید.",
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: LandinaTextField(
                  hintText: "ایمیل و یا نام کاربری",
                  suffixIcon: IconlyLight.info_circle,
                  suffixIconOnPressed: () {
                    loginModal(context);
                  },
                  prefixIcon: IconlyLight.user,
                  prefixIconOnPressed: () {},
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: LandinaTextField(
                  hintText: "رمز عبور",
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
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: LandinaButton(
                  title: "ورود به حساب کاربری",
                  onPressed: () {},
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
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "فراموشی رمز",
                        style: TextStyle(
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
                      },
                      child: const Text(
                        "ایجاد حساب",
                        style: TextStyle(
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
    );
  }
}
