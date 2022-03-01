import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/components/form_validator.dart';

class LoginPage extends StatelessWidget {
  final AuthProvider provider;

  const LoginPage({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: provider.emailController,
          validator: FormValidator.email,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          maxLength: 48,
          decoration:
              _setDecoration(AppStrings.email, Icons.alternate_email_outlined),
        ),
        SizedBox(height: 12.h),
        TextFormField(
          controller: provider.passwordController,
          validator: FormValidator.password,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: true,
          maxLength: 24,
          decoration:
              _setDecoration(AppStrings.password, Icons.password_outlined),
        ),
      ],
    );
  }

  InputDecoration _setDecoration(String hint, IconData icon) => InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
      );
}
