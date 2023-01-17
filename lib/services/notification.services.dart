import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:landina_coupon/main.dart';
import 'package:landina_coupon/ui/widgets/buttons/text.button.dart';
import 'package:landina_coupon/ui/widgets/modal/modal.dart';
import 'package:landina_coupon/utilities/uniqueId.utilites.dart';

Future<void> allowNotification(context) async {
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      landinaModal(
        StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Text(
                    "بهم اجازه ارسال نوتیفیکیشن رو میدی؟",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "قول میدم اذیتت نکنم! فقط اعلان های واجب رو برات ارسال می کنم تا حواست پرت نشه!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ButtonBarSuper(
                    lineSpacing: 15,
                    wrapType: WrapType.balanced,
                    wrapFit: WrapFit.proportional,
                    children: [
                      LandinaTextButton(
                        title: "بله حتما",
                        backgroundColor: true,
                        onPressed: () async {
                          AwesomeNotifications()
                              .requestPermissionToSendNotifications()
                              .then(
                                (_) => Navigator.pop(context),
                              );
                        },
                      ),
                      LandinaTextButton(
                        title: "نه اصلا",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
        context,
      );
    }
  });
}

Future<void> followedNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: "related_channel",
      title:
          "${Emojis.money_chart_increasing_with_yen + Emojis.plant_cactus} نوتیفیکیشن جدید!",
      body: "بدنه نوتیفیکیشن اینجاست!",
      bigPicture: "asset://assets/images/hand_shake.png ",
      notificationLayout: NotificationLayout.BigPicture,
      actionType: ActionType.Default,
    ),
  );
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    LandinaCoupon.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notifications',
        (route) => (route.settings.name != '/notifications') || route.isFirst,
        arguments: receivedAction);
  }
}
