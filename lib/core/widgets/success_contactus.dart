import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_nxt_professional/core/resources/style.dart';

void showSuccessContactusDialog(BuildContext context, Function() onPressedFun) {
  showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SuccessContactusDialog(
            onPressed: onPressedFun,
          ),
        ],
      );
    },
  );
}

class SuccessContactusDialog extends StatelessWidget {
  const SuccessContactusDialog({Key? key, required this.onPressed})
      : super(key: key);
  final primaryColor = Colors.black;
  final accentColor = const Color(0xffffffff);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(14),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      icon: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.close,
              size: 38,
            )),
      ),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/images/circle_right.svg"),
              FixedSizeBox.height16,
              Text(
                "SUCCESSFULLY SENT!".tr(),
                style: GoogleFonts.bebasNeue(
                  color: Colors.black,
                  fontSize: 30.sp,
                ),
              ),
              const SizedBox(height: 3.5),
              Text(
                "Thanks for getting in touch. We will review your message and get back to you."
                    .tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: const Color(0xFF707070),
                    ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SimpleButton(
                    text: "home".tr(),
                    onPressed: onPressed,
                    invertedColors: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  const SimpleButton({
    required this.text,
    required this.onPressed,
    this.invertedColors = false,
    Key? key,
  }) : super(key: key);
  final primaryColor = Colors.black;
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: WidgetStateProperty.all(0),
              alignment: Alignment.center,
              side: WidgetStateProperty.all(
                  BorderSide(width: 1, color: primaryColor)),
              padding: WidgetStateProperty.all(const EdgeInsets.only(
                  right: 25, left: 25, top: 0, bottom: 0)),
              backgroundColor: WidgetStateProperty.all(
                  invertedColors ? accentColor : primaryColor),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.bebasNeue(
              fontSize: 16,
              color: invertedColors ? primaryColor : accentColor,
            ),
          )),
    );
  }
}
