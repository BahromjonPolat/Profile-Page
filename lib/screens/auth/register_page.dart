import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/components/form_validator.dart';
import 'package:profile/provider/auth_provider.dart';
import 'package:profile/widgets/primary_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => AuthProvider(),
      builder: (_, __) {
        AuthProvider provider = _.watch();
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: provider.nameController,
                      validator: FormValidator.general,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      maxLength: 48,
                      decoration: _setDecoration(
                          AppStrings.fullName, Icons.person_outline),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: provider.emailController,
                      validator: FormValidator.email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      maxLength: 48,
                      decoration: _setDecoration(
                          AppStrings.email, Icons.alternate_email_outlined),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: provider.passwordController,
                      validator: FormValidator.password,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      maxLength: 24,
                      decoration: _setDecoration(
                          AppStrings.password, Icons.password_outlined),
                    ),
                    SizedBox(height: 24.h),
                    PrimaryButton(
                      onPressed: provider.onPressed,
                      label: AppStrings.signUp,
                    ),
                  ],
                ).sp(h: 20.w),
              ),
            ),
          ),
        );
      },
    );
  }

  InputDecoration _setDecoration(String hint, IconData icon) => InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
      );
}
