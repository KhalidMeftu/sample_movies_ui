import 'package:flutter/material.dart';

class AppFonts {
  static const String roboto = 'Roboto';

  static TextStyle _baseFont({
    required String fontFamily,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle extraSmall({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w700,
    required String fontFamily,
  }) {
    return _baseFont(
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontSize: 10, // Assuming you have a constant for font sizes, adjust accordingly
    );
  }

  static TextStyle small({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    required String fontFamily,
  }) {
    return _baseFont(
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontSize: 12, // Adjust font size as needed
    );
  }

  static TextStyle medium({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    required String fontFamily,
  }) {
    return _baseFont(
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontSize: 16, // Adjust font size as needed
    );
  }

  static TextStyle large({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
    required String fontFamily,
  }) {
    return _baseFont(
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontSize: 24, // Adjust font size as needed
    );
  }
}
