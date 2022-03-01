import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/provider/auth_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       ListenableProvider(
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
                       TextFormField(controller: provider.nameController),
                       TextFormField(controller: provider.emailController),
                       TextFormField(controller: provider.passwordController),
                       ElevatedButton(onPressed: provider.onPressed, child: Text('Register'))
                     ],
                   ),
                 ),
               ),
             ),
           );
         },
       );
  }
}
