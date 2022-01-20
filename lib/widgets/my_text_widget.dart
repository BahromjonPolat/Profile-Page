import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyTextWidget extends StatelessWidget {
  String data;
  Color color;
  double size;
  FontWeight weight;
  int lines;
  String family;
  TextAlign align;

  MyTextWidget(
    this.data, {
    Key? key,
    this.color = ConstColor.text,
    this.size = 14.0,
    this.weight = FontWeight.w500,
    this.lines = 1,
    this.family = 'SF-Pro',
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
      style: TextStyle(
        fontSize: getWidth(size),
        fontWeight: weight,
        color: color,
        fontFamily: family,
      ),
    );
  }
}
