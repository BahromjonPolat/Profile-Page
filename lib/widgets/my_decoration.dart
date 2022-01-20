import 'package:flutter/material.dart';
import 'package:profile/core/components/size_config.dart';

class MyDecoration {
  static BoxDecoration circular({Color? color, double radius = 16.0}) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          getHeight(radius),
        ),
      );
}
