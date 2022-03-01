class FormValidator {
  static String? email(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(value, _emailPattern)) {
      return "Input valid email";
    }
  }

  static String? password(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(value, _passwordPattern)) {
      return "Password is not safety";
    }
  }

  static String? general(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 6) {
      return "Minimum 6 characters";
    }
  }

  static bool _validPattern(String value, String pattern) {
    return RegExp(pattern).hasMatch(value);
  }

  static const String _emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  static const String _passwordPattern =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$";
}
