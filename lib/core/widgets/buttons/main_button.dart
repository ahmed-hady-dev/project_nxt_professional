import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? borderColor;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final bool isLoading;
  final bool? removeBorder;
  final double? width;
  final double? radius;

  const ContinueButton({
    super.key,
    required this.title,
    required this.onTap,
    this.borderColor,
    this.textStyle,
    this.color,
    this.padding,
    this.isLoading = false,
    this.removeBorder = false,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? Colors.black,
          borderRadius:
              removeBorder == true ? null : BorderRadius.circular(radius ?? 12),
          border: Border.all(color: borderColor ?? Colors.black),
        ),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: color != null ? Colors.black : Colors.white,
                  ),
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle ??
                    const TextStyle(
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}
