import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_nxt_professional/core/routes/imports.dart';
import 'package:project_nxt_professional/core/widgets/buttons/main_button.dart';

class PaymentSuccessfully extends StatelessWidget {
  const PaymentSuccessfully(
      {super.key, required this.challenge, required this.onTap});
  final bool challenge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      icon: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Align(
            alignment: Alignment.centerRight, child: Icon(Icons.close)),
      ),
      title: Text(
        "congratulation".tr(),
        maxLines: 1,
        style: const TextStyle(
          fontSize: 42,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            challenge ? "paymentSuccessChallenge".tr() : "paymentSuccess".tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ContinueButton(
            title: "OK".tr(),
            onTap: () {
              onTap();
              AppRouter.pop();
            },
          ),
        ],
      ),
    );
  }
}
