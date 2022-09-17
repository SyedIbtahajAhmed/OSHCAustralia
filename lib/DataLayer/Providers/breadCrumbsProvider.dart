import 'package:flutter/material.dart';

class BreadCrumbsProvider extends ChangeNotifier {
  int _selected = 0;

  int get selected => _selected;

  setSelectedBreadCrumbValue(int value) {
    _selected = value;
    notifyListeners();
  }

  incrementBreadCrumb() {
    if (_selected < 3) {
      _selected += 1;
      print(_selected);
    } else {
      _selected = 0;
    }
    notifyListeners();
  }
}