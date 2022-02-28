import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyText extends StatelessWidget {
  String data;
  Color color;
  double size;
  FontWeight weight;
  int? lines;
  String family;
  TextAlign align;
  TextOverflow? overflow;

  MyText(
    this.data, {
    Key? key,
    this.color = ConstColor.text,
    this.size = 14.0,
    this.weight = FontWeight.w500,
    this.lines,
    this.family = 'SF-Pro',
    this.align = TextAlign.start,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: lines,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
        fontSize: size.sp,
        fontWeight: weight,
        color: color,
        fontFamily: family,
      ),
    );
  }
}
