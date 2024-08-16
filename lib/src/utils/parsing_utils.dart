import 'package:flutter/material.dart' as flutter;

class ParsingUtils {
  static double parseSize(dynamic size) {
    if (size is String) {
      return double.parse(size.replaceAll('px', ''));
    }
    return size?.toDouble() ?? 0.0;
  }

  static flutter.Color parseColor(dynamic color) {
  if (color is String) {
    String formattedColor = color.startsWith('#') ? color.substring(1) : color;
    return flutter.Color(int.parse('0xFF$formattedColor'));
  }
  return flutter.Colors.transparent;
}

  static double parseFontSize(dynamic fontSize) {
    if (fontSize is String) {
      return double.parse(fontSize.replaceAll('sp', ''));
    }
    return fontSize?.toDouble() ?? 14.0;
  }
}
