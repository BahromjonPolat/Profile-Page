import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyEdgeInsets {
  static EdgeInsets symmetric({double h = 0.0, double v = 0.0}) =>
      EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(h),
        vertical: getProportionateScreenHeight(v),
      );

  static EdgeInsets all(double size) => EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(size),
        vertical: getProportionateScreenHeight(size),
      );
}
