import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_nxt_professional/core/widgets/snackbar_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logout_dialog.dart';

class Utils {
  //==== stop screenshot and screen record functionality====
  // static addSecureFlag() async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // }

  //==== restore screenshot and screen record functionality====
  // static clearSecureFlag() async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // }
  static int createUniqueId() =>
      DateTime.now().millisecondsSinceEpoch.remainder(100000);

  static Future<void> launchAppUrl(
      {required String url,
      LaunchMode mode = LaunchMode.externalApplication}) async {
    try {
      await launchUrl(
        Uri.parse(url),
        mode: mode,
      );
    } catch (e) {
      log(e.toString());
      SnackBarHelper.showBasicSnack(msg: 'cannotOpenLink'.tr());
    }
  }

  static DateTime? localDateFromIsoUTC(String? iso) {
    if (iso == null) return null;
    return DateTime.parse(iso).add(DateTime.now().timeZoneOffset);
  }

  static String parseDuration({required String durationInMinutes}) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = durationInMinutes.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    final duration =
        Duration(hours: hours, minutes: minutes, microseconds: micros);
    final String durationTime =
        "${duration.inMinutes.remainder(60) == 00 ? '' : '${(duration.inMinutes.remainder(60))} ${'h'.tr()} '}${duration.inSeconds.remainder(60) == 00 ? '' : '${(duration.inSeconds.remainder(60))} ${'m'.tr()}'}";
    return durationTime;
  }

  static showAlertDialog({
    required BuildContext context,
    required String headerText,
    required Function() onPressed,
    Function()? onCancelPressed,
    String? yesButtonText,
    bool? barrierDismissible,
    String? noButtonText,
    Widget? customContent,
    bool? useLoading,
    List<Widget>? customActions,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return MyDialog(
          onPressed: onPressed,
          headerText: headerText,
          noButtonText: noButtonText,
          yesButtonText: yesButtonText,
          customContent: customContent,
          useLoading: useLoading,
          customActions: customActions,
          onCancelPressed: onCancelPressed,
        );
      },
    );
  }

  static showOKAlertDialog({
    required BuildContext context,
    required String headerText,
    required Function() onPressed,
    Function()? onCancelPressed,
    String? yesButtonText,
    bool? barrierDismissible,
    String? noButtonText,
    Widget? customContent,
    bool? useLoading,
    List<Widget>? customActions,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return MyOKDialog(
          onPressed: onPressed,
          headerText: headerText,
          noButtonText: noButtonText,
          yesButtonText: yesButtonText,
          customContent: customContent,
          useLoading: useLoading,
          customActions: customActions,
          onCancelPressed: onCancelPressed,
        );
      },
    );
  }

  static showPAlertDialog({
    required BuildContext context,
    required String headerText,
    required Function() onPressed,
    Function()? onCancelPressed,
    String? yesButtonText,
    bool? barrierDismissible,
    String? noButtonText,
    Widget? customContent,
    bool? useLoading,
    List<Widget>? customActions,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return MyDialog(
          onPressed: onPressed,
          headerText: headerText,
          noButtonText: noButtonText,
          yesButtonText: yesButtonText,
          customContent: customContent,
          useLoading: useLoading,
          customActions: customActions,
          onCancelPressed: onCancelPressed,
        );
      },
    );
  }

  static showWaitAlertDialog({
    required BuildContext context,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Please Wait Till The Upload is done",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!,
          ),
          actions: [
            SimpleButton(
              text: "ok",
              invertedColors: false,
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showTextFieldsDialog({
    required BuildContext context,
    required String headerText,
    Function()? onPressed,
    Function()? onCancelPressed,
    Widget? customContent,
    bool? useLoading,
    List<Widget>? customActions,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
          onPressed: onPressed!,
          headerText: headerText,
          customContent: customContent,
          useLoading: useLoading,
          customActions: customActions,
          onCancelPressed: onCancelPressed,
        );
      },
    );
  }

// static Future<void> checkSafeDevice(BuildContext context) async {
//   if (!await SafeDevice.isJailBroken &&
//       (await SafeDevice.isRealDevice || kDebugMode)) {
//     return;
//   } else {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return CupertinoAlertDialog(
//           title: const Text('Warning'),
//           content: const Text(
//             'This app can\'t run on jailbroken or rooted devices',
//           ),
//           actions: [
//             CupertinoDialogAction(
//               child: const Text('Exit'),
//               onPressed: () => exit(0),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
}

/*

// static Future<int> getRegisterAttempts() async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// int registerAttempts = prefs.getInt('registerAttempts') ?? 1;
// return registerAttempts;
// }
//
// static Future<void> increaseRegisterAttempts(int registerAttempts) async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
//
// int currentRegisterAttempts = await getRegisterAttempts();
// prefs.setInt(
// 'registerAttempts', currentRegisterAttempts + registerAttempts);
// }
//
// static Future<void> resetRegisterAttempts() async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.setInt('registerAttempts', 0);
// }
//
// static Future<void> setLastTimeOfRegisterAttempt() async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.setString('lastTimeOfRegisterAttempt', DateTime.now().toString());
// }
//
// static Future<String> getLastTimeOfRegisterAttempt() async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// String lastTimeOfRegisterAttempt =
//     prefs.getString('lastTimeOfRegisterAttempt') ?? "";
// return lastTimeOfRegisterAttempt;
// }
//
// static Future<bool> canMakeNewRegisterAttempt() async {
// String lastTimeOfRegisterAttempt = await getLastTimeOfRegisterAttempt();
//
// if (lastTimeOfRegisterAttempt.isNotEmpty) {
// DateTime lastTimeOfRegisterAttemptDateTime =
// DateTime.parse(lastTimeOfRegisterAttempt);
// DateTime now = DateTime.now();
// Duration difference = now.difference(lastTimeOfRegisterAttemptDateTime);
// if (difference.inSeconds > 60 || await getRegisterAttempts() <= 3) {
// return true;
// } else {
// return false;
// }
// } else {
// return true;
// }
// }
//
//
//
//  */
class MyDialog extends StatefulWidget {
  final String headerText;
  final Function() onPressed;
  final Function()? onCancelPressed;
  final String? yesButtonText;
  final String? noButtonText;
  final Widget? customContent;
  final bool? useLoading;
  final List<Widget>? customActions;

  const MyDialog({
    Key? key,
    required this.headerText,
    required this.onPressed,
    this.yesButtonText,
    this.noButtonText,
    this.customContent,
    this.useLoading = true,
    this.customActions,
    this.onCancelPressed,
  }) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      contentPadding:
          const EdgeInsets.only(bottom: 8, top: 24, left: 6, right: 6),
      actions: widget.customActions ??
          [
            SimpleButton(
              text: widget.noButtonText ?? "no".tr(),
              invertedColors: true,
              onPressed: () async {
                if (widget.onCancelPressed != null) {
                  await widget.onCancelPressed!();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
            const SizedBox(width: 4),
            isLoading && (widget.useLoading ?? true)
                ? Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Opacity(
                        opacity: 0.0,
                        child: SimpleButton(
                            text: widget.yesButtonText ?? "yes".tr(),
                            onPressed: () {}),
                      ),
                      const SizedBox(
                          width: 64,
                          height: 20,
                          child: FittedBox(
                              child: CircularProgressIndicator.adaptive())),
                    ],
                  )
                : SimpleButton(
                    text: widget.yesButtonText ?? "yes".tr(),
                    onPressed: () => setState(() {
                          isLoading = !isLoading;
                          widget.onPressed();
                          isLoading = !isLoading;
                        })),
          ],
      content: widget.customContent ??
          Text(
            widget.headerText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!,
          ),
    );
  }
}

class MyOKDialog extends StatefulWidget {
  final String headerText;
  final Function() onPressed;
  final Function()? onCancelPressed;
  final String? yesButtonText;
  final String? noButtonText;
  final Widget? customContent;
  final bool? useLoading;
  final List<Widget>? customActions;

  const MyOKDialog({
    Key? key,
    required this.headerText,
    required this.onPressed,
    this.yesButtonText,
    this.noButtonText,
    this.customContent,
    this.useLoading = true,
    this.customActions,
    this.onCancelPressed,
  }) : super(key: key);

  @override
  State<MyOKDialog> createState() => _MyOKDialogState();
}

class _MyOKDialogState extends State<MyOKDialog> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      contentPadding:
          const EdgeInsets.only(bottom: 8, top: 24, left: 6, right: 6),
      actions: widget.customActions ??
          [
            // SimpleButton(
            //   text: widget.noButtonText ?? "no".tr(),
            //   invertedColors: true,
            //   onPressed: () async {
            //     if (widget.onCancelPressed != null)
            //       await widget.onCancelPressed!();
            //     MagicRouter.pop();
            //   },
            // ),
            // const SizedBox(width: 4),
            // isLoading && (widget.useLoading ?? true)
            //     ? Stack(
            //         alignment: Alignment.center,
            //         children: <Widget>[
            //           Opacity(
            //             opacity: 0.0,
            //             child: SimpleButton(
            //                 text: widget.yesButtonText ?? "yes".tr(),
            //                 onPressed: () {}),
            //           ),
            //           const SizedBox(
            //               width: 64,
            //               height: 20,
            //               child: FittedBox(
            //                   child: CircularProgressIndicator.adaptive())),
            //         ],
            //       )
            SimpleButton(
                text: widget.yesButtonText ?? "ok".tr(),
                onPressed: () => setState(() {
                      Navigator.of(context).pop();
                    })),
          ],
      content: widget.customContent ??
          Text(
            widget.headerText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!,
          ),
    );
  }
}
