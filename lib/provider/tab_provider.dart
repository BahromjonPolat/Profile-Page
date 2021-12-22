import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int _index = 0;

  void onTap(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
}
