import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_nxt_professional/core/theme/theme.dart';
import 'package:project_nxt_professional/locator.dart' as locator;
import 'package:timeago/timeago.dart' as timeago;

import 'core/resources/bloc_observer.dart';
import 'bloc_observer.dart';
import 'core/resources/notification.dart';
import 'core/routes/imports.dart';
import 'features/choose_language/presentation/controller/splash_cubit.dart';
import 'features/tab_bar/presentation/controller/tab_bar_cubit.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await locator.init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationHelper.instance.setupNotification();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      path: 'assets/translation',
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

void setTimeAgo() {
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('en_short', timeago.EnShortMessages());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (_) => NotificationCubit(sl.get<NotificationRepoImpl>())..getNotifications(),
        // ),
        BlocProvider(
          create: (context) => sl.get<TabBarCubit>()
            ..getVerticals()
            ..getUnread(context)
            ..getUser(),
        ),
        BlocProvider(
          create: (_) => sl.get<SplashCubit>()..init(),
        ),
        // BlocProvider(
        //   create: (_) => sl.get<ReadsCubit>(),
        // ),
        // BlocProvider(
        //   create: (context) => sl.get<ClassDetailsCubit>(),
        // ),
        // BlocProvider(create: (context) => sl.get<ProfileCubit>()..getUser()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: false,
          builder: (context, child) {
            return MaterialApp(
              title: 'ProjectNXT',
              theme: lightTheme(context),
              debugShowCheckedModeBanner: false,
              navigatorKey: AppRouter.appKey,
              scaffoldMessengerKey: AppRouter.scaffoldKey,
              onGenerateRoute: AppRouter.generateRoute,
              // home: ChangePlayerThemePage(),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
            );
          }),
    );
  }
}
