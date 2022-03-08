import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class UserProfileProvider extends ChangeNotifier {
  final UserModel _user = UserModel.fromJson(GetStorage().read('user'));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  bool _isEdit = false;

  UserProfileProvider() {
    _emailController = TextEditingController(text: _user.email);
    _passwordController = TextEditingController();
    _nameController = TextEditingController(text: _user.fullName);
    _phoneController = TextEditingController(text: _user.phone ?? '');
  }

  void changeStatus() {
    _isEdit = !_isEdit;
    notifyListeners();
  }

  bool get isEdit => _isEdit;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get nameController => _nameController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get emailController => _emailController;

  GlobalKey<FormState> get formKey => _formKey;
}
