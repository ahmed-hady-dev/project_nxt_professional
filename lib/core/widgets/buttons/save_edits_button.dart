import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_nxt_professional/core/theme/fonts.dart';

class SaveEditsButton extends StatelessWidget {
  const SaveEditsButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
          textStyle: TextStyle(fontFamily: AppFonts.montserratSemiBold, fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : Text('save_edits'.tr().toUpperCase()),
      ),
    );
  }
}
