import 'package:flutter/material.dart';

class RefreshProvider extends ChangeNotifier {
  void refresh() {
    notifyListeners();
  }
}
