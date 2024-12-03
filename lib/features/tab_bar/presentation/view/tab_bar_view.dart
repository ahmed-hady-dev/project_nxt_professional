import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_nxt_professional/features/tab_bar/presentation/controller/tab_bar_cubit.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/widgets/nxt_app_bar.dart';

class NxtTabBarView extends StatelessWidget {
  const NxtTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarCubit, TabBarState>(
      builder: (context, state) {
        final cubit = TabBarCubit.get(context);
        return Scaffold(
          appBar: NxtAppBar(),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                label: 'home'.tr(),
                icon: SvgPicture.asset(
                  Assets.home,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.home,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'learn'.tr(),
                icon: SvgPicture.asset(
                  Assets.learn,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.learn,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'compete'.tr(),
                icon: SvgPicture.asset(
                  Assets.challenges,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.challenges,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'connect'.tr(),
                icon: SvgPicture.asset(
                  Assets.read,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.read,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'profile'.tr(),
                icon: SvgPicture.asset(
                  Assets.profile,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.profile,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
