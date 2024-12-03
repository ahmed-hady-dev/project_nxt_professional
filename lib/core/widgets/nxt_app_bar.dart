import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_nxt_professional/core/routes/imports.dart';

import '../../features/tab_bar/presentation/controller/tab_bar_cubit.dart';
import '../../locator.dart';
import '../datasource/local/local.dart';
import '../resources/assets.dart';
import '../resources/style.dart';
import '../routes/routes_name.dart';

class NxtAppBar extends StatelessWidget implements PreferredSizeWidget {
  NxtAppBar({
    super.key,
    this.showBackButton = false,
    this.isMore = false,
    this.isNotification = false,
  });

  final bool showBackButton;
  final bool isMore;
  final bool isNotification;
  var prefHelper = sl.get<PrefHelper>();

  @override
  Widget build(BuildContext context) {
    final cubit = TabBarCubit.get(context);

    return AppBar(
      primary: true,
      surfaceTintColor: Colors.transparent,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          )),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: showBackButton ? true : false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => AppRouter.pop(),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            )
          : null,
      title: Row(
        mainAxisAlignment: !showBackButton
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/withoutfab3.svg",
            width: 50.w,
            height: 50.w,
          ),
          FixedSizeBox.width4,
          if (prefHelper.logo != null && prefHelper.logo!.isNotEmpty)
            Image.network(
              prefHelper.logo ?? "",
              width: 50.w,
              height: 50.w,
            )
        ],
      ),
      actions: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 8.0),
        //   child: GestureDetector(
        //     onTap: () => Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => ChatPage())),
        //     child: badges.Badge(
        //       ignorePointer: false,
        //       badgeAnimation: const badges.BadgeAnimation.slide(
        //         animationDuration: Duration(seconds: 1),
        //         colorChangeAnimationDuration: Duration(seconds: 1),
        //         loopAnimation: false,
        //         curve: Curves.fastOutSlowIn,
        //         colorChangeAnimationCurve: Curves.easeInCubic,
        //       ),
        //       badgeStyle: badges.BadgeStyle(
        //         borderRadius: BorderRadius.circular(4),
        //       ),
        //       child: SvgPicture.asset(Assets.message),
        //     ),
        //   ),
        // ),
        FixedSizeBox.width12,
        GestureDetector(
          onTap: () => !isNotification ? AppRouter.push(notification) : null,
          // child: SvgPicture.asset(Assets.notification),
          child: badges.Badge(
            showBadge: cubit.showNotificationBadge,
            ignorePointer: false,
            position: badges.BadgePosition.topEnd(top: -5, end: -6),
            onTap: () {},
            badgeAnimation: const badges.BadgeAnimation.slide(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            badgeStyle: badges.BadgeStyle(
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(Assets.notification),
          ),
        ),
        FixedSizeBox.width8,
        GestureDetector(
          onTap: () {
            if (!isMore) {
              AppRouter.push(more);
            }
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: SvgPicture.asset(Assets.more),
          ),
        ),
        FixedSizeBox.width24,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);
}
