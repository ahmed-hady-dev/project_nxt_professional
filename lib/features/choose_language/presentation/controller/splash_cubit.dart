import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nxt_professional/core/datasource/local/local.dart';
import 'package:project_nxt_professional/features/choose_language/data/model/config.dart';

import '../../../../core/routes/imports.dart';
import '../../../../core/routes/routes_name.dart';
import '../../data/repo/config_repo.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.configRepo, this.prefHelper) : super(SplashInitial());
  final ConfigRepo configRepo;
  final PrefHelper prefHelper;
  static SplashCubit get(context) => BlocProvider.of(context);

  ConfigData? data;

  Future<void> getAppData() async {
    emit(SplashLoading());
    var result = await configRepo.getAppData();
    result.fold((l) {
      emit(SplashError());
    }, (r) {
      data = r.data;
      prefHelper.landingImage = data?.template.landingPage ?? "";
      if (data!.template.sponsoredLogos.isNotEmpty) {
        prefHelper.logo = data!.template.sponsoredLogos[0];
      } else {
        prefHelper.logo = null;
      }
      prefHelper.banner = data?.template.banner;
      emit(SplashSuccess());
    });
  }

  void init() {
    Future.delayed(const Duration(seconds: 1), () {
      prefHelper.locale = "en";
      getAppData();
      // prefHelper.token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OWZjNmU5ZDA1NjJkOTg3Mzg3NzNhMiIsImxhbmd1YWdlIjoiZW4iLCJpYXQiOjE3MjIzNzUwNDh9.ENitt3IbdTp97K4TczJm4XPu6W_e9gnF_P00W1w0r1w";
      if (prefHelper.token.isNotEmpty) {
        AppRouter.push(tabBar, clean: true);
        return;
      } else if (prefHelper.firstTime == false) {
        AppRouter.push(login, clean: true);
      } else {
        AppRouter.push(chooseLanguage, clean: true);
      }
    });
  }
}
