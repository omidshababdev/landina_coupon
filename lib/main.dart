import 'dart:ui';

/* PACKAGES */
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/* ROUTES */
import 'package:landina_coupon/ui/pages/account/account.dart';
import 'package:landina_coupon/ui/pages/account/profile/chats/chats.dart';
import 'package:landina_coupon/ui/pages/account/contacts/contacts.dart';
import 'package:landina_coupon/ui/pages/account/profile/followers/followers.profile.dart';
import 'package:landina_coupon/ui/pages/account/profile/followings/followings.profile.dart';
import 'package:landina_coupon/ui/pages/account/profile/links/links.dart';
import 'package:landina_coupon/ui/pages/account/login/forget/forget.dart';
import 'package:landina_coupon/ui/pages/account/settings/proxy/view.dart';
import 'package:landina_coupon/ui/pages/account/signUp/email/email.dart';
import 'package:landina_coupon/ui/pages/account/settings/view.dart';
import 'package:landina_coupon/ui/pages/account/signUp/password/password.dart';
import 'package:landina_coupon/ui/pages/account/signUp/username/username.dart';
import 'package:landina_coupon/ui/pages/categories/categories.dart';
import 'package:landina_coupon/ui/pages/coupon/new/new.coupon.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';
import 'package:landina_coupon/ui/pages/account/login/login.dart';
import 'package:landina_coupon/ui/pages/account/profile/view.dart';

/* LOCALIZATIONS */
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

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
        GetPage(name: "/followers", page: () => FollowersPage()),
        GetPage(name: "/followings", page: () => FollowingsPage()),
        GetPage(name: "/guide", page: () => FollowersPage()),
        GetPage(name: "/proxy", page: () => const ProxyPage()),
        GetPage(name: "/settings", page: () => const SettingsPage()),
        GetPage(name: "/contacts", page: () => const ContactsPage()),
        GetPage(name: "/chats", page: () => const ChatsPage()),
        GetPage(name: "/links", page: () => LinksPage()),
        GetPage(name: "/categories", page: () => const CategoriesPage()),
        GetPage(name: "/coupon/new", page: () => const NewCouponPage()),
      ],
      home: HomePage(),
    );
  }
}
