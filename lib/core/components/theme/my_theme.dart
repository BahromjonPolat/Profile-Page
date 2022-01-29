import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'SF-Pro',
    canvasColor: ConstColor.primary,
    primaryColor: ConstColor.secondary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ConstColor.primary,
      elevation: 0.0,
    )
  );
}
