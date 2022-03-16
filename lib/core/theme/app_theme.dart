import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyTheme {
  static ThemeData light = ThemeData(
      fontFamily: 'SF-Pro',
      canvasColor: AppColors.primary,
      primaryColor: AppColors.secondary,

      /// APP BAR THEME
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0.0,
      ),

      /// ELEVATED BUTTON THEME
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.secondary,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.w)),
          textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          fixedSize: Size(375.w, 48.h),
        ),
      ),

      /// INPUT FIELD DECORATION
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        counterStyle: const TextStyle(height: 0.0, color: Colors.transparent),
        focusedBorder: _underlineInputBorder(),
        border: _underlineInputBorder(),
        errorBorder: _underlineInputBorder(),
      ),

      /// FloatingActionButtonTheme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.secondary,
        elevation: 0.0,
      ));

  static UnderlineInputBorder _underlineInputBorder() => UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(7.w),
      );
}
