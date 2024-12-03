import 'package:project_nxt_professional/features/tab_bar/data/repo/root_repo.dart';
import 'package:project_nxt_professional/features/tab_bar/presentation/controller/tab_bar_cubit.dart';

import '../../locator.dart';

Future<void> tabBarInit() async {
  sl.registerSingleton<RootRepoImpl>(RootRepoImpl(sl()));

  sl.registerFactory(() => TabBarCubit(sl.get<RootRepoImpl>()));
}
