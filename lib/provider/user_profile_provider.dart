import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isEdit = false;

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