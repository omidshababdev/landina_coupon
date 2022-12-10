import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landina_coupon/ui/pages/brand/brand.dart';
import 'package:landina_coupon/ui/pages/categories/categories.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/ui/pages/account/login/login.dart';

import 'package:landina_coupon/ui/pages/account/profile/profile.dart';
import 'package:quick_actions/quick_actions.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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

  QuickActions quickActions = const QuickActions();

  Map quickActionsReturns = {
    'homePage': const HomePage(),
    'categories': const CategoriesPage(),
    'profile': const ProfilePage(),
  };

  @override
  void initState() {
    super.initState();

    quickActions.initialize((type) {
      return _navigate(quickActionsReturns[type]);
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: "homePage",
        localizedTitle: "کوپن ها",
      ),
      const ShortcutItem(
        type: "categories",
        localizedTitle: "دسته بندی ها",
      ),
      const ShortcutItem(
        type: "profile",
        localizedTitle: "حساب کاربری",
      ),
    ]);
  }

  void _navigate(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
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
        GetPage(name: "/profile", page: () => const ProfilePage()),
        GetPage(name: "/brand", page: () => const BrandPage()),
        GetPage(name: "/categories", page: () => const CategoriesPage()),
      ],
      home: const HomePage(),
    );
  }
}
