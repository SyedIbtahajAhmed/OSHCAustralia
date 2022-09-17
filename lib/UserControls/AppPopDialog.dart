import 'package:flutter/material.dart';
import 'package:oshcaustralia/UserControls/appButton.dart';

import '../Constants/AppConstants.dart';

class AppPopUpDialog extends StatelessWidget {
  final String titleText;
  final String actionButtonText;
  final Widget content;

  const AppPopUpDialog({
    Key? key,
    required this.actionButtonText,
    required this.titleText,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          titleText,
          style: TextStyle(
            fontSize: AppConstants.appFontSizeh5,
            color: AppConstants.appBlueColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            content,
          ],
        ),
      ),
      actions: <Widget>[
        AppButton(
          width: 100.0,
          height: 40.0,
          primaryColor: AppConstants.appBlueColor,
          borderRadius: 10.0,
          text: actionButtonText,
          fontSize: AppConstants.appFontSizeh3,
          fontWeight: FontWeight.w500,
          textColor: AppConstants.appWhiteColor,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
