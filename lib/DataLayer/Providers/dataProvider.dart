import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final Map<String, dynamic> _data = {
    'QuoteData' : {},
    'SelectedProviderData' : {},
  };

  // Getter
  Map<String, dynamic> get Data => _data;

  // Setter
  setDataOnKey(String key, dynamic value) {
    _data[key] = value;
    notifyListeners();
  }

  // Clear
  clearProvider() {
    for (String key in _data.keys) {
      _data[key] = {};
    }
    notifyListeners();
  }
}