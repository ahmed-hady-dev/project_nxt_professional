import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_nxt_professional/core/theme/colors.dart';
import 'package:project_nxt_professional/core/theme/fonts.dart';

import '../../../../core/resources/style.dart';

class ListMoreButton extends StatelessWidget {
  const ListMoreButton({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          SvgPicture.asset('assets/images/add_icon.svg'),
          FixedSizeBox.width8,
          Text(
            'list_more'.tr().toUpperCase(),
            style: TextStyle(color: ColorsManager.lightGray, fontFamily: AppFonts.montserratSemiBold, fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
