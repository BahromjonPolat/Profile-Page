import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class CustomIconButton extends StatelessWidget {
  VoidCallback onPressed;
  String assetIcon;
  double vPadding;
  Color? color;
  CustomIconButton({
    required this.onPressed,
    required this.assetIcon,
    this.vPadding = 0.0,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: MyEdgeInsets.symmetric(v: vPadding),
      // constraints: const BoxConstraints(),
      icon: SvgPicture.asset(assetIcon, color: color),
    );
  }
}
