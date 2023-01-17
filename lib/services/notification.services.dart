import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:landina_coupon/utilities/uniqueId.utilites.dart';

Future<void> followedNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: createUniqueId(),
        channelKey: "related_channel",
        title:
            "${Emojis.money_chart_increasing_with_yen + Emojis.plant_cactus} نوتیفیکیشن جدید!",
        body: "بدنه نوتیفیکیشن اینجاست!",
        bigPicture: "asset://assets/images/hand_shake.png ",
        notificationLayout: NotificationLayout.BigPicture),
  );
}
