import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyBoxConstraints {
  static BoxConstraints box({double maxWidth = 280.0}) =>
      BoxConstraints(
        maxWidth: getWidth(maxWidth),
      );
}
