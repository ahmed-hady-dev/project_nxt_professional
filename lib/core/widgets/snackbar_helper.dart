import 'package:flutter/material.dart';
import 'package:project_nxt_professional/core/routes/imports.dart';

class SnackBarHelper {
  static void showAppSnack(
      Widget child, Color shapeColor, Color backgroundColor,
      {bool isShapeDefaultColor = true,
      bool isDefaultBackGroundColor = true,
      Duration? duration}) {
    ScaffoldMessenger.of(AppRouter.appKey.currentContext!)
        .hideCurrentSnackBar();
    ScaffoldMessenger.of(AppRouter.appKey.currentContext!).showSnackBar(
        SnackBar(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isShapeDefaultColor ? Colors.black : shapeColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            duration: duration ?? const Duration(milliseconds: 800),
            backgroundColor:
                isDefaultBackGroundColor ? Colors.white : backgroundColor,
            content: child));
  }

  static void showBasicSnack({required String msg, Color? color}) {
    ScaffoldMessenger.of(AppRouter.appKey.currentContext!)
        .hideCurrentSnackBar();
    ScaffoldMessenger.of(AppRouter.appKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: color,
    ));
  }

  static void customShowAppSnack(
      Widget child, Color shapeColor, Color backgroundColor,
      {bool isShapeDefaultColor = true, bool isDefaultBackGroundColor = true}) {
    ScaffoldMessenger.of(AppRouter.appKey.currentContext!)
        .hideCurrentSnackBar();
    ScaffoldMessenger.of(AppRouter.appKey.currentContext!).showSnackBar(
        SnackBar(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isShapeDefaultColor ? Colors.black : shapeColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            duration: const Duration(milliseconds: 800),
            backgroundColor:
                isDefaultBackGroundColor ? Colors.white : backgroundColor,
            content: child));
  }

// static Future<void> showAppToast(String msg, {bool short = false, Color? color}) async {
//   await Fluttertoast.cancel();
//   Fluttertoast.showToast(
//     msg: msg,
//     toastLength: short ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
//     backgroundColor: color,
//   );
// }
}
