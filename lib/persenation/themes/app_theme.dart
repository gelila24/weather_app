import 'package:flutter/material.dart';

class AppTheme {
  //colors
  static const Color primaryColor = Colors.orange;

  //text styles
  static TextStyle get primaryTextStyle => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get secondaryTextStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get normalTextStyle =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  //Box decorations
  static BoxDecoration get mainButtonDecoration => BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(30),
      );
}
