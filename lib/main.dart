import 'dart:async';
import 'dart:ui';

/* PACKAGES */
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/constants/theme.dart';
import 'package:landina_coupon/constants/translation.dart';
import 'package:flutter/foundation.dart';
import 'package:landina_coupon/ui/pages/account/profile/chats/room/view.dart';
import 'package:landina_coupon/ui/pages/account/profile/chats/single/view.dart';
import 'package:landina_coupon/ui/pages/coupon/comments/comments.coupon.dart';
import 'package:landina_coupon/ui/pages/notifications/view.dart';

/* ROUTES */
import 'package:landina_coupon/ui/pages/account/view.dart';
import 'package:landina_coupon/ui/pages/account/profile/analytics/view.dart';
import 'package:landina_coupon/ui/pages/account/profile/chats/chats.dart';
import 'package:landina_coupon/ui/pages/account/contacts/contacts.dart';
import 'package:landina_coupon/ui/pages/account/profile/analytics/followers/followers.profile.dart';
import 'package:landina_coupon/ui/pages/account/profile/analytics/followings/followings.profile.dart';
import 'package:landina_coupon/ui/pages/account/profile/links/links.dart';
import 'package:landina_coupon/ui/pages/account/register/login/forget/forget.dart';
import 'package:landina_coupon/ui/pages/account/settings/about/about.dart';
import 'package:landina_coupon/ui/pages/account/settings/fonts/view.dart';
import 'package:landina_coupon/ui/pages/account/settings/help/view.dart';
import 'package:landina_coupon/ui/pages/account/settings/language/view.dart';
import 'package:landina_coupon/ui/pages/account/settings/proxy/view.dart';
import 'package:landina_coupon/ui/pages/soon/view.dart';
import 'package:landina_coupon/ui/pages/account/settings/update/view.dart';
import 'package:landina_coupon/ui/pages/account/register/signup/email/email.dart';
import 'package:landina_coupon/ui/pages/account/settings/view.dart';
import 'package:landina_coupon/ui/pages/account/register/signup/password/password.dart';
import 'package:landina_coupon/ui/pages/account/register/signup/username/username.dart';
import 'package:landina_coupon/ui/pages/categories/categories.dart';
import 'package:landina_coupon/ui/pages/coupon/new/new.coupon.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';
import 'package:landina_coupon/ui/pages/account/register/login/login.dart';
import 'package:landina_coupon/ui/pages/account/profile/view.dart';

/* LOCALIZATIONS */
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'services/notification.services.dart';
import 'ui/widgets/buttons/text.button.dart';
import 'ui/widgets/modal/modal.dart';

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

  await GetStorage.init();

  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      // Error Notification
      NotificationChannel(
        channelGroupKey: 'landina_coupon_channel',
        channelKey: 'error_channel',
        channelName: 'Error notifications',
        defaultColor: Colors.teal,
        channelDescription: 'Notification channel for errors',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),

      // Followed by Notification
      NotificationChannel(
        channelGroupKey: 'landina_coupon_channel',
        channelKey: 'followed_by_channel',
        channelName: 'Followed by notifications',
        defaultColor: Colors.teal,
        channelDescription: 'Notification channel for when someone follows you',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),

      // Sth Created Notification
      NotificationChannel(
        channelGroupKey: 'landina_coupon_channel',
        channelKey: 'sth_created_channel',
        channelName: 'Something Created notifications',
        defaultColor: Colors.teal,
        channelDescription: 'Notification channel for when something created',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),

      // Landina Notifications
      NotificationChannel(
        channelGroupKey: 'landina_coupon_channel',
        channelKey: 'landina_notifications_channel',
        channelName: 'Landina Notifications',
        defaultColor: Colors.teal,
        channelDescription:
            'Notification channel for when Landina Notifications',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'landina_coupon_channel',
        channelGroupName: 'Landina Notifications',
      ),
    ],
  );

  runApp(
    const LandinaCoupon(),
  );
}

class LandinaCoupon extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const LandinaCoupon({super.key});

  @override
  State<LandinaCoupon> createState() => _LandinaCouponState();
}

class _LandinaCouponState extends State<LandinaCoupon> {
  VoidCallback rebuildOnLocaleChange() => () => setState(() {});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();

    return GetMaterialApp(
      // The navigator key is necessary to allow to navigate through static methods
      navigatorKey: LandinaCoupon.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: Config.packageInfo.appName,
      themeMode: Config.getThemeStatus(),
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Get.deviceLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      unknownRoute: GetPage(name: "/soon", page: () => const SoonPage()),
      initialRoute: "/",
      routingCallback: (routing) {
        //
      },
      // onGenerateRoute: Router.generateRoute,
      getPages: [
        GetPage(name: "/soon", page: () => const SoonPage()),
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/signUp/username", page: () => const UsernamePage()),
        GetPage(name: "/signUp/email", page: () => const EmailPage()),
        GetPage(name: "/signUp/password", page: () => const PasswordPage()),
        GetPage(name: "/forget", page: () => const ForgetPage()),
        GetPage(name: "/profile", page: () => ProfilePage()),
        GetPage(
          name: "/account",
          page: () => AccountPage(
            analytics: analytics,
            observer: observer,
          ),
        ),
        GetPage(name: "/followers", page: () => FollowersPage()),
        GetPage(name: "/followings", page: () => FollowingsPage()),
        GetPage(name: "/analytics", page: () => const AnalyticsPage()),
        GetPage(name: "/help", page: () => const HelpPage()),
        GetPage(name: "/about", page: () => const AboutPage()),
        GetPage(name: "/fonts", page: () => const FontsPage()),
        GetPage(name: "/proxy", page: () => const ProxyPage()),
        GetPage(name: "/update", page: () => const UpdatePage()),
        GetPage(name: "/notifications", page: () => const NotificationsPage()),
        GetPage(name: "/language", page: () => const LanguagePage()),
        GetPage(name: "/settings", page: () => const SettingsPage()),
        GetPage(name: "/contacts", page: () => const ContactsPage()),
        GetPage(name: "/chats", page: () => const ChatsPage()),
        GetPage(name: "/chats/single", page: () => const SingleChatPage()),
        GetPage(name: "/chats/room", page: () => const RoomChatPage()),
        GetPage(name: "/links", page: () => LinksPage()),
        GetPage(name: "/categories", page: () => const CategoriesPage()),
        GetPage(name: "/coupon/new", page: () => const NewCouponPage()),
        GetPage(name: "/coupon/comments", page: () => const CommentsPage()),
      ],
      translationsKeys: Translation.translationsKeys,
      fallbackLocale: const Locale("en"),
      defaultTransition: Transition.native,
      home: HomePage(),
    );
  }
}
