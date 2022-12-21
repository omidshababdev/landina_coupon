import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instabug_flutter/instabug_flutter.dart';
import 'package:landina_coupon/ui/pages/account/account.dart';
import 'package:landina_coupon/ui/pages/account/contacts/contacts.dart';
import 'package:landina_coupon/ui/pages/account/links/links.dart';
import 'package:landina_coupon/ui/pages/account/login/forget/forget.dart';
import 'package:landina_coupon/ui/pages/account/signUp/email/email.dart';
import 'package:landina_coupon/ui/pages/account/settings/settings.dart';
import 'package:landina_coupon/ui/pages/account/signUp/password/password.dart';
import 'package:landina_coupon/ui/pages/account/signUp/username/username.dart';
import 'package:landina_coupon/ui/pages/categories/categories.dart';
import 'package:landina_coupon/ui/pages/coupon/new/new.coupon.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';
import 'package:landina_coupon/ui/pages/account/login/login.dart';
import 'package:landina_coupon/ui/pages/account/profile/profile.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetStorage.init();

  runApp(
    const LandinaCoupon(),
  );
}

class LandinaCoupon extends StatefulWidget {
  const LandinaCoupon({super.key});

  @override
  State<LandinaCoupon> createState() => _LandinaCouponState();
}

class _LandinaCouponState extends State<LandinaCoupon> {
  VoidCallback rebuildOnLocaleChange() => () => setState(() {});

  @override
  void initState() {
    super.initState();
    // Instabug.start('526221477a496ef5b199095f54c9b198',
    //     [Instabug.invocationEvent.shake, InvocationEvent.screenshot]);
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = window.locale;
    PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landina Coupon',
      theme: ThemeData(
        fontFamily: myLocale.languageCode == "en" ? "Poppins" : "Estedad",
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          toolbarHeight: 65,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontFamily: "Estedad",
            fontWeight: FontWeight.w500,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff0F172A),
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: myLocale.languageCode == "en" ? "Poppins" : "Estedad",
        appBarTheme: const AppBarTheme(
          elevation: 0,
          toolbarHeight: 65,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "Estedad",
            fontWeight: FontWeight.w500,
          ),
        ),

        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Get.deviceLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/signUp/username", page: () => const UsernamePage()),
        GetPage(name: "/signUp/email", page: () => const EmailPage()),
        GetPage(name: "/signUp/password", page: () => const PasswordPage()),
        GetPage(name: "/forget", page: () => const ForgetPage()),
        GetPage(name: "/profile", page: () => ProfilePage()),
        GetPage(name: "/account", page: () => AccountPage()),
        GetPage(name: "/settings", page: () => const SettingsPage()),
        GetPage(name: "/contacts", page: () => const ContactsPage()),
        GetPage(name: "/links", page: () => const LinksPage()),
        GetPage(name: "/categories", page: () => const CategoriesPage()),
        GetPage(name: "/coupon/new", page: () => const NewCouponPage()),
      ],
      home: HomePage(),
    );
  }
}
