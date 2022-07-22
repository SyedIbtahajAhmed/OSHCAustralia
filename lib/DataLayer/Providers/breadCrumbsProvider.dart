import 'package:flutter/material.dart';

class BreadCrumbsProvider extends ChangeNotifier {
  int _selected = 0;

  int get selected => _selected;

  incrementBreadCrumb() {
    if (_selected < 3) {
      _selected += 1;
    } else {
      _selected = 0;
    }
    notifyListeners();
  }
}