import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyBorderRadius {
  static BorderRadius circular({double radius = 16.0}) =>
      BorderRadius.circular(getWidth(radius));

  static BorderRadius only({
    double topRight = 0.0,
    double topLeft = 0.0,
    double bottomRight = 0.0,
    double bottomLeft = 0.0,
  }) =>
      BorderRadius.only(
        topRight: _setRadius(topRight),
        topLeft: _setRadius(topLeft),
        bottomRight: _setRadius(bottomRight),
        bottomLeft: _setRadius(bottomLeft),
      );

  static Radius _setRadius(double radius) => Radius.circular(getWidth(radius));
}
