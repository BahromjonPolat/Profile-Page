import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class CustomIconButton extends StatelessWidget {
  VoidCallback onPressed;
  String assetIcon;

  CustomIconButton({
    required this.onPressed,
    required this.assetIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: MyEdgeInsets.symmetric(v: 12.0),
      constraints: const BoxConstraints(),
      icon: SvgPicture.asset(assetIcon),
    );
  }
}
