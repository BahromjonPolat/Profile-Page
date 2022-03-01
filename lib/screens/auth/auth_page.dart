import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/provider/auth_provider.dart';
import 'package:profile/screens/auth/login_page.dart';
import 'package:profile/screens/auth/register_page.dart';
import 'package:profile/widgets/primary_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => AuthProvider(),
      builder: (ctx, w) {
        AuthProvider provider = ctx.watch();
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyText(
                    provider.isLogin ? AppStrings.signIn : AppStrings.signUp,
                    size: 24.0,
                  ),
                  SizedBox(height: 24.h),
                  Form(
                    key: provider.formKey,
                    child: provider.isLogin
                        ? LoginPage(provider: provider)
                        : RegisterPage(provider: provider),
                  ),
                  SizedBox(height: 24.h),
                  PrimaryButton(
                    onPressed: provider.onPressed,
                    label: provider.isLogin
                        ? AppStrings.signIn
                        : AppStrings.signUp,
                  ),
                  SizedBox(height: 24.h),
                  TextButton(
                    onPressed: provider.changePage,
                    child: Text(AppStrings.signIn),
                  )
                ],
              ).sp(h: 20.w),
            ),
          ),
        );
      },
    );
  }
}
