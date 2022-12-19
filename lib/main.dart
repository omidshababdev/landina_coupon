import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:landina_coupon/ui/pages/account/account.dart';
import 'package:landina_coupon/ui/pages/account/links/links.dart';
import 'package:landina_coupon/ui/pages/account/login/forget/forget.dart';
import 'package:landina_coupon/ui/pages/account/register/email/email.dart';
import 'package:landina_coupon/ui/pages/account/settings/settings.dart';
import 'package:landina_coupon/ui/pages/categories/categories.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/pages/account/login/login.dart';

import 'package:landina_coupon/ui/pages/account/profile/profile.dart';
import 'package:landina_coupon/ui/pages/web/web.page.dart';

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
        GetPage(name: "/signUp", page: () => const EmailPage()),
        GetPage(name: "/forget", page: () => const ForgetPage()),
        GetPage(name: "/profile", page: () => ProfilePage()),
        GetPage(name: "/account", page: () => AccountPage()),
        GetPage(name: "/settings", page: () => const SettingsPage()),
        GetPage(name: "/links", page: () => const LinksPage()),
        GetPage(name: "/categories", page: () => const CategoriesPage()),
        GetPage(name: "/website", page: () => const WebPage()),
      ],
      home: HomePage(),
    );
  }
}
