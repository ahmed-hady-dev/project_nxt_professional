import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nxt_professional/core/datasource/local/local.dart';
// import 'package:project_nxt_professional/features/home/presentation/view/home_view.dart';
// import 'package:project_nxt_professional/features/notification/data/model/notification_model.dart';
import 'package:project_nxt_professional/features/tab_bar/data/model/user.dart';
import 'package:project_nxt_professional/features/tab_bar/data/repo/root_repo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../locator.dart';
// import '../../../compete/presentation/all_challenges/compete_screen.dart';
// import '../../../connect/connect_screen.dart';
// import '../../../learn/learn_screen.dart';
// import '../../../notification/presentation/controller/notification_cubit.dart';
// import '../../../profile/profile_screen.dart';
import '../../data/model/vertical.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit(this.repo) : super(TabBarInitial());

  final RootRepo repo;
  // final PrefHelper prefHelper;

  static TabBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 4;
  void changeIndex(int index) {
    currentIndex = index;
    emit(TabBarInitial());
  }

  Verticals verticals = [];
  NxtUser? user;

  Future<void> getVerticals() async {
    var result = await repo.getVerticals();
    result.fold((l) => null, (r) => verticals = r);
  }

  Future<void> getUser() async {
    var result = await repo.gerCurrentUser();
    result.fold((l) => null, (r) => user = r);
  }

  List<Widget> screens = const [
    // HomeView(),
    // LearnScreen(),
    // CompeteScreen(),
    // ConnectScreen(),
    // ProfileScreen(),
  ];

  Future<void> getUnread(BuildContext context) async {
    var result = await repo.getUnread();
    result.fold((l) => null, (r) {
      showNotificationBadge = r.notification;
      connectToSocket(context);
    });
  }

  bool showNotificationBadge = false;

  void connectToSocket(BuildContext context) {
    bool showSnackbarDisconnect = true;
    var prefHelper = sl<PrefHelper>();
    IO.Socket socket = IO.io(
      'https://revamp-api-dev.projectnxt.app/notification-center',
      {
        "auth": {"token": prefHelper.token},
        "transports": ["websocket"],
      },
    );
    socket.connect();
    socket.onConnecting((data) => emit(SocketConnecting()));
    socket.onConnect((_) {
      emit(SocketConnected());
    });
    socket.on('NEW_NOTIFICATION', (data) {});
    socket.on('event', (data) => debugPrint("###### $data"));
    socket.onAny((event, data) {
      debugPrint("###### $event $data");
      if (event == "NewNotification") {}
      if (event == "NEW_NOTIFICATION") {
        showNotificationBadge = true;
        emit(ShowNotificationBadge());

        // var notificationCubit = NotificationCubit.get(context);
        // if (notificationCubit.notifications != null) {
        //   notificationCubit.notifications!.insert(
        //     0,
        //     NotificationModel(
        //       id: data['_id'],
        //       redirectionType: data['redirectionType'],
        //       createdAt: data['createdAt'],
        //       title: data['title'][context.locale.languageCode],
        //       details: data['details'][context.locale.languageCode],
        //       redirectionId: data['redirectionId'],
        //       isRead: false,
        //     ),
        //   );
        // }
      }
      if (event != "connect") {}
    });
    socket.onDisconnect((_) {
      if (showSnackbarDisconnect) {
        // AppRouter.pop();
      }
    });
  }

  toggleNotificationBadge() {
    if (showNotificationBadge == true) {
      showNotificationBadge = false;
    }
    emit(ShowNotificationBadge());
  }
}
