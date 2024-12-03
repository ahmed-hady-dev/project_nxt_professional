import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHelper {
  static final NotificationHelper instance = NotificationHelper._();
  static final _messaging = FirebaseMessaging.instance;

  NotificationHelper._();

  Future<void> setupNotification() async {
    await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: false,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    _messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: false, sound: true);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});

    // FirebaseMessaging.instance.

    //   FirebaseMessaging.instance.getInitialMessage().then((message) {
    //     if (message != null) {
    //       Future.delayed(const Duration(seconds: 2)).then((_) {
    //         if (message.data['type'] == "class") {
    //           if (message.data['id'] != null) {
    //             MagicRouter.navigateTo(ClassScreen(classId: message.data['id']));
    //           } else {
    //             MagicRouter.navigateTo(Navigation(navigationIndex: 1));
    //           }
    //         } else if (message.data['type'] == "workshop") {
    //           if (message.data['id'] != null) {
    //             MagicRouter.navigateTo(ViewWorkShopsScreen(
    //                 workshop: WorkshopModel(id: message.data['id']), type: ""));
    //           } else {
    //             MagicRouter.navigateTo(Navigation(
    //               navigationIndex: 1,
    //               librarySelectedPage: 0,
    //             ));
    //           }
    //         } else if (message.data['type'] == "read") {
    //           if (message.data['id'] != null) {
    //             MagicRouter.navigateTo(ReadScreen(readId: message.data['id']));
    //           } else {
    //             MagicRouter.navigateTo(Navigation(
    //               navigationIndex: 1,
    //               librarySelectedPage: 2,
    //             ));
    //           }
    //         } else if (message.data['type'] == "challenge") {
    //           if (message.data['id'] != null) {
    //             MagicRouter.navigateTo(BlocProvider.value(
    //               value: ChallengeCubit()
    //                 ..onInit(
    //                   challengeId: message.data['id'],
    //                 ),
    //               child: ViewChallengeScreen(challengeId: message.data['id']),
    //             ));
    //           } else {
    //             MagicRouter.navigateTo(Navigation(navigationIndex: 2));
    //           }
    //         } else if (message.data['type'] == 'profile') {
    //           MagicRouter.navigateTo(Navigation(
    //             navigationIndex: HiveHelper.isRegularUser ? 4 : 3,
    //           ));
    //         } else if (message.data['type'] == 'inbox') {
    //           if (message.data['id'] != null) {
    //             MagicRouter.navigateTo(BlocProvider.value(
    //               value: MailboxCubit()
    //                 ..getMessages(true, message.data['id'], true),
    //               child: const MessagesScreen(),
    //             ));
    //           } else {
    //             MagicRouter.navigateTo(const MailBoxScreen());
    //           }
    //         } else if (message.data['type'] == "submission" &&
    //             message.data['id'] != null &&
    //             message.data['extraId'] != null) {
    //           // String challengeId = "64c160d931012519c1073b61";
    //           MagicRouter.navigateTo(
    //             BlocProvider.value(
    //                 value: ChallengeCubit()
    //                   ..getVotesForChallenge(message.data['extraId'])
    //                   ..getCurrentUserChallenge(message.data['extraId']),
    //                 child: UserChallengePageViewBuilder(
    //                   submissionId: message.data['id'],
    //                   userChallengeIndex: -1,
    //                   itemCount: -1,
    //                   votesList: const [],
    //                   showLike: false,
    //                   showVote: false,
    //                   media: "",
    //                   isVideo: false,
    //                   challengeId: message.data['extraId'],
    //                   isText: false,
    //                 )),
    //           );
    //         } else if (message.data['type'] == "profile" &&
    //             message.data['id'] != null) {
    //           MagicRouter.navigateTo(CommunityUserProfile(
    //               userId: message.data['id'], jobScreen: false));
    //         } else if (message.data['type'] == "job") {
    //           if (message.data['id'] != null) {
    //             MagicRouter.navigateTo(BlocProvider.value(
    //               value: ConnectCubit()..getAllJobs(),
    //               child: const ExpertsAndJobsScreen(),
    //             ));
    //           } else {
    //             MagicRouter.navigateTo(Navigation(navigationIndex: 3));
    //           }
    //         }
    //       });
    //     }
    //   });
    //
    //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //     // if (message.notification != null) {
    //     if (Platform.isAndroid) {
    //       FlutterLocalNotificationUtils.instance.showInstantNotification(
    //           id: 1,
    //           title: message.notification!.title!,
    //           body: message.notification!.body!);
    //       // }
    //     }
    //   });
    // }

    Future<String?> getToken() async {
      return await _messaging.getToken();
    }
  }
}
