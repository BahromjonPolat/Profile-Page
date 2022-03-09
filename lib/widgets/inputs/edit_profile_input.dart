import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class EditProfileInput extends StatelessWidget {
  final TextEditingController controller;
  final String assetIcon;
  final String label;
  const EditProfileInput({
    Key? key,
    required this.controller,
    required this.assetIcon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(label),
            filled: false,
            border: _buildOutlineInputBorder(),
            prefixIcon: SvgPicture.asset(
              assetIcon,
              fit: BoxFit.none,
              color: AppColors.secondary,
            ),
          ),
        ),
        const Divider(color: AppColors.secondary)
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() =>
      const OutlineInputBorder(borderSide: BorderSide.none);
}
