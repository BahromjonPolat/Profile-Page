import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class UserProfileProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isEdit = false;

  UserProfileProvider({required UserModel user}) {
    // _emailController.text = user.email!;
    // _passwordController.text = user.password!;
    // _fullNameController.text = user.fullName!;
    // _phoneController.text = user.phone!;
  }

  void changeStatus() {
    _isEdit = !_isEdit;
    notifyListeners();
  }

  void onUpdateButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      String fullName = _fullNameController.text.trim();
      String email = _emailController.text.trim().toLowerCase();
      // String password = _passwordController.text.trim();

    }
  }

  bool get isEdit => _isEdit;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get fullNameController => _fullNameController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get emailController => _emailController;

  GlobalKey<FormState> get formKey => _formKey;
}
