import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyEdgeInsets {
  static EdgeInsets symmetric({double h = 0.0, double v = 0.0}) =>
      EdgeInsets.symmetric(
        horizontal: getHeight(h),
        vertical: getHeight(v),
      );

  static EdgeInsets all(double size) => EdgeInsets.symmetric(
        horizontal: getWidth(size),
        vertical: getHeight(size),
      );
}
