import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_nxt_professional/core/routes/imports.dart';

import '../../locator.dart';
import '../datasource/local/local.dart';

class AppBarTitle extends StatelessWidget {
  AppBarTitle({super.key});

  var prefHelper = sl.get<PrefHelper>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () => AppRouter.pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 26.r,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/withoutfab3.svg",
                  width: 50.w,
                  height: 65.w,
                ),
                if (prefHelper.logo != null && prefHelper.logo!.isNotEmpty)
                  Image.network(
                    prefHelper.logo ?? "",
                    width: 50.w,
                    height: 65.w,
                  )
              ],
            ),
          ),
        ),
        Expanded(flex: 1, child: Container()),
      ],
    );
  }
}
