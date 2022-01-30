import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/components/size_config.dart';
import 'package:profile/widgets/my_border_radius.dart';

class MyDecoration {
  static BoxDecoration circular({Color? color, double radius = 16.0}) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          getHeight(radius),
        ),
      );

  static BoxDecoration only(
          {BorderRadiusGeometry? borderRadius, Color? color}) =>
      BoxDecoration(
        borderRadius: borderRadius,
        color: color,
      );
}
