import 'package:flutter/material.dart';

import '../Constants/AppConstants.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final Color primaryColor;
  final double borderRadius;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final VoidCallback onPressed;
  const AppButton({
    Key? key,
    required this.width,
    required this.height,
    required this.primaryColor,
    required this.borderRadius,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        overflow: TextOverflow.fade,
        maxLines: 1,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
