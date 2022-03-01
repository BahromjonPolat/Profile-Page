import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget sp({double h = 0.0, double v = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
        child: this,
      );
}
