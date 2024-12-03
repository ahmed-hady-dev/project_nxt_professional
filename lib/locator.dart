import 'package:get_it/get_it.dart';
import 'package:project_nxt_professional/core/repo/general_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/datasource/local/local.dart';
import 'core/datasource/remote/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => PrefHelper(sl()));
  sl.registerLazySingleton(() => DioClient(sl()));

  sl.registerSingleton<GeneralRepoImpl>(GeneralRepoImpl(dio: sl()));
  //
  // chooseLanguageInit();
  // authInit();
  // homeInit();
  // tabBarInit();
  // paymentInit();
  // learnInit();
  // profileInit();
  // moreInit();
  // connectInit();
  // competeInit();
  // notificationInit();
}
