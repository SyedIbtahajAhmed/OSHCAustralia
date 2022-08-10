import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helpers {
  static Future<DatePickerDialog> showDatePickerDialog({
    required BuildContext context,
    required DateTime? initialDate,
  }) async {
    final selected = await DatePickerDialog(
      firstDate: DateTime(2019),
      lastDate: DateTime(2030), initialDate: initialDate ?? DateTime.now(),
    );
    return selected;
  }
}