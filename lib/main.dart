import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:landina_coupon/ui/pages/categories/categories.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';

import 'package:landina_coupon/ui/pages/profile/profile.dart';
import 'package:quick_actions/quick_actions.dart';

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
  QuickActions quickActions = const QuickActions();

  Map quickActionsReturns = {
    'homePage': const HomePage(),
    'categories': const CategoriesPage(),
    'profile': ProfilePage(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landina Coupon',
      theme: ThemeData(
        fontFamily: "Estedad",
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
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('en', ''), // English, no country code
        Locale('fa', ''), // Persian, no country code
      ],
      home: const HomePage(),
    );
  }
}
