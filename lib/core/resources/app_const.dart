import 'package:flutter/material.dart';
import 'package:project_nxt_professional/core/routes/imports.dart';

extension Height on Widget {
  double get height => MediaQuery.of(AppRouter.appKey.currentContext!).size.height;
}

extension Width on Widget {
  double get width => MediaQuery.of(AppRouter.appKey.currentContext!).size.width;
}
// extension IsEn on Widget {
//   bool get isEn => AppRouter.appKey.currentContext!.locale.languageCode == 'en';
// }
//
// extension Height on Widget {
//   double get height =>
//       MediaQuery.of(AppRouter.appKey.currentContext!).size.height;
// }
//
// extension Width on Widget {
//   double get width =>
//       MediaQuery.of(AppRouter.appKey.currentContext!).size.width;
// }
