import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class CustomInput extends StatelessWidget {
  CustomInput({Key? key}) : super(key: key);
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _editingController,
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: AppStrings.message,
      filled: true,
      contentPadding: MyEdgeInsets.symmetric(h: 12.0),
      fillColor: Colors.white,
      border: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
    );
  }

  OutlineInputBorder _outlineInputBorder() => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(
          getWidth(16.0),
        ),
      );
}
