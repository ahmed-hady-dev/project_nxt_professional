import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  const OutlineButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
