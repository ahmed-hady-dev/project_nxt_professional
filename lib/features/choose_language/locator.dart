import 'package:project_nxt_professional/features/choose_language/data/repo/config_repo.dart';
import 'package:project_nxt_professional/features/choose_language/presentation/controller/splash_cubit.dart';

import '../../core/datasource/remote/dio_client.dart';
import '../../locator.dart';

Future<void> chooseLanguageInit() async {
  sl.registerSingleton<ConfigRepoImpl>(ConfigRepoImpl(DioClient(sl())));

  sl.registerFactory(() => SplashCubit(sl.get<ConfigRepoImpl>(), sl()));
}
