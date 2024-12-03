import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_nxt_professional/core/datasource/local/local.dart';

import '../../locator.dart';
import '../routes/imports.dart';
import '../routes/routes_name.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLogOutDialog(
            onLogOutPressed: () async {
              var helper = sl.get<PrefHelper>();
              helper.clearValues();
              AppRouter.push(login, clean: true);
            },
          ),
        ],
      );
    },
  );
}

class CustomLogOutDialog extends StatelessWidget {
  const CustomLogOutDialog({Key? key, required this.onLogOutPressed}) : super(key: key);
  final primaryColor = Colors.black;
  final accentColor = const Color(0xffffffff);
  final Function() onLogOutPressed;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "logout".tr(),
              style: GoogleFonts.bebasNeue(
                color: Colors.black,
                fontSize: 30.sp,
              ),
            ),
            const SizedBox(height: 3.5),
            Text(
              "logoutSure".tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xFF707070),
                  ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleButton(
                  text: "cancel".tr(),
                  onPressed: () => AppRouter.pop(),
                ),
                SimpleButton(
                  text: "logout".tr(),
                  onPressed: onLogOutPressed,
                  invertedColors: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  const SimpleButton({required this.text, required this.onPressed, this.invertedColors = false, Key? key})
      : super(key: key);
  final primaryColor = Colors.black;
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.bebasNeue(
            fontSize: 16,
            color: invertedColors ? primaryColor : accentColor,
          ),
        ));
  }
}
