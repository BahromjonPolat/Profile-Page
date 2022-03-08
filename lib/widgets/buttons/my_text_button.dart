import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class MyTextButton extends StatelessWidget {
  VoidCallback onPressed;
  String label;

  MyTextButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: MyText(label));
  }
}
