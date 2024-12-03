import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownField<T> extends StatefulWidget {
  DropdownField({
    super.key,
    required this.values,
    required this.valuesString,
    required this.hint,
    this.textStyle,
    this.dropdownValue,
    this.prefix,
    this.hintStyle,
  });
  final TextStyle? textStyle;
  final List<T> values;
  final List<String> valuesString;
  final String? hint;
  final Widget? prefix;
  final TextStyle? hintStyle;
  T? dropdownValue;

  @override
  State<DropdownField<T>> createState() => _DropdownFieldState<T>();
}

class _DropdownFieldState<T> extends State<DropdownField<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: DropdownMenu<T>(
        width: MediaQuery.of(context).size.width - 52,
        hintText: widget.hint,
        leadingIcon: widget.prefix,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintStyle: widget.hintStyle ??
              TextStyle(
                color: const Color(0xffA5A5A5),
                fontSize: 13.sp,
              ),
          enabledBorder: border(),
          focusedBorder: border(),
        ),
        onSelected: (T? value) {
          setState(() {
            widget.dropdownValue = value;
          });
        },
        dropdownMenuEntries: widget.values.map<DropdownMenuEntry<T>>((T value) {
          return DropdownMenuEntry<T>(value: value, label: value.toString());
        }).toList(),
      ),
    );
  }

  OutlineInputBorder border() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1),
    );
  }
}
