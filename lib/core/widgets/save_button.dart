import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_nxt_professional/core/resources/style.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.isSaved, this.onSavedTap});
  final bool isSaved;
  final VoidCallback? onSavedTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSavedTap,
      child: Row(
        children: [
          isSaved
              ? SvgPicture.asset(
                  "assets/images/saved.svg",
                  color: Colors.black,
                  height: 22,
                  width: 22,
                )
              : SvgPicture.asset(
                  "assets/images/Path 187.svg",
                  height: 22,
                  width: 22,
                ),
          FixedSizeBox.width8,
          Text(
            isSaved ? "Saved" : "Save",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
