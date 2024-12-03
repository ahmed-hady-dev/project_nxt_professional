import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FlutterLocalNotificationUtils {
  static final FlutterLocalNotificationUtils instance =
      FlutterLocalNotificationUtils();
  final String _notificationIcon =
      'resource://drawable/res_notification_app_icon';
  final String _channelKey = 'basic_channel';
  final String _channelGroupKey = 'basic_channel_group';

  final _awesomeNotifications = AwesomeNotifications();

  final _permissions = [
    // NotificationPermission.Alert,
    NotificationPermission.Sound,
    // NotificationPermission.Vibration,
  ];

  void init() async {
    await _awesomeNotifications.initialize(
      _notificationIcon,
      [
        NotificationChannel(
          channelKey: _channelKey,
          channelGroupKey: _channelGroupKey,
          channelName: 'Basic Notifications',
          channelDescription: 'Notification channel for basic functionality',
          importance: NotificationImportance.High,
          // channelShowBadge: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: _channelGroupKey,
          channelGroupName: 'Scheduled group',
        ),
      ],
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // _awesomeNotifications.(
    //   onActionReceivedMethod: _onNotificationClicked,
    // );
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    _awesomeNotifications.createNotificationFromJsonData(message.data);
  }

  Future<void> checkIsAllowed(BuildContext context) async {
    // final bool isNotificationAllowed = await HiveHelper.getNotificationsStatus;
    // AwesomeNotifications().isNotificationAllowed().then(
    //   (isAllowed) async {
    //     if (!isAllowed) {
    //       if (isNotificationAllowed != false) {
    //         await Utils.showAlertDialog(
    //           headerText: '',
    //           context: context,
    //           barrierDismissible: false,
    //           yesButtonText: 'allow'.tr(),
    //           noButtonText: 'dontAllow'.tr(),
    //           onCancelPressed: () async =>
    //               await HiveHelper.cacheNotificationsIsNotAllowed(value: false),
    //           onPressed: () => checkPermission().then((_) => MagicRouter.pop()),
    //           customContent: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: <Widget>[
    //               Text(
    //                 'allowNotifications'.tr(),
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //                     fontFamily: AppConst.isEn ? 'Montserrat' : 'Tajawal',
    //                     fontWeight: FontWeight.bold),
    //               ),
    //               const SizedBox(height: 6),
    //               Text(
    //                 'ourAppNotifications'.tr(),
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //                     fontFamily: AppConst.isEn ? 'Montserrat' : 'Tajawal'),
    //               )
    //             ],
    //           ),
    //         );
    //       }
    //     }
    //   },
    // );
  }

  Future<bool> checkPermission() async {
    return _awesomeNotifications.requestPermissionToSendNotifications(
      channelKey: _channelKey,
      permissions: _permissions,
    );
  }

  // Future<void> showScheduledNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  //   required Duration duration,
  // }) async {
  //   String localTimeZone =
  //       await _awesomeNotifications.getLocalTimeZoneIdentifier();
  //   await _awesomeNotifications.createNotification(
  //     content: NotificationContent(
  //       id: id,
  //       channelKey: _channelKey,
  //       groupKey: _channelGroupKey,
  //       title: title,
  //       body: body,
  //       wakeUpScreen: true,
  //       category: NotificationCategory.Alarm,
  //       fullScreenIntent: true,
  //     ),
  //     schedule: NotificationInterval(
  //       interval: duration.inSeconds,
  //       timeZone: localTimeZone,
  //       preciseAlarm: false,
  //       allowWhileIdle: false,
  //     ),
  //   );
  // }

  Future<void> showInstantNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    await _awesomeNotifications.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: _channelKey,
        groupKey: _channelGroupKey,
        title: title,
        body: body,
        wakeUpScreen: true,
        category: NotificationCategory.Message,
        criticalAlert: false,
        showWhen: true,
        fullScreenIntent: true,
      ),
    );
  }

  // static Future<void> _onNotificationClicked(
  //     ReceivedAction receivedAction) async {
  //   if (receivedAction.channelKey == instance._channelKey && Platform.isIOS) {
  //     AwesomeNotifications().getGlobalBadgeCounter().then(
  //         (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1));
  //   }
  //   PopupHelper.showAppSnack(
  //     Text(receivedAction.toString(), style: const TextStyle()),
  //     Colors.indigo,
  //     Colors.indigo,
  //     isShapeDefaultColor: false,
  //     isDefaultBackGroundColor: false,
  //     duration: const Duration(days: 1),
  //   );
  // }

  Future<void> cancelNotification(int id) async {
    return _awesomeNotifications.cancelSchedule(id);
  }
}
