import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NxtTextField extends StatelessWidget {
  const NxtTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefix,
    this.hintStyle,
    this.validator,
    this.maxLines,
    this.suffixIcon,
    this.suffix,
    this.type = TextInputType.text,
    this.onTap,
    this.inputBorder,
    this.expands = false,
    this.style,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.text,
  });
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final bool expands;
  final TextInputType type;
  final Function()? onTap;
  final String? text;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final InputBorder? inputBorder;
  final String hintText;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? Function(String?)? validator;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller ?? TextEditingController(text: text),
      validator: validator,
      maxLines: maxLines,
      onTap: onTap,
      expands: expands,
      style: style,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefix,
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffix: suffix,
        suffixIconColor: Colors.black,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        hintStyle: hintStyle ??
            TextStyle(
              color: const Color(0xffA5A5A5),
              fontSize: 13.sp,
            ),
        enabledBorder: inputBorder ?? border(),
        focusedBorder: inputBorder ?? border(),
        border: inputBorder ?? border(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}

OutlineInputBorder border() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: const BorderSide(color: Colors.grey, width: 1),
  );
}
