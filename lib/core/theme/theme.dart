import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    brightness: Brightness.light,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.black,
      secondary: Colors.black,
      surfaceContainerHigh: Colors.white,
    ),
    dividerTheme: const DividerThemeData(color: Colors.black),
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Montserrat'),
    primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: 'Montserrat'),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      hintStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w100,
        color: Color(0xFF787878),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: ColorsManager.tabBarGrey,
      labelStyle: GoogleFonts.bebasNeue(fontSize: 17.sp),
      unselectedLabelStyle: GoogleFonts.bebasNeue(fontSize: 17.sp),
    ),
  );
}
