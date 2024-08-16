import 'package:flutter/material.dart' as flutter;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPassParser {
  static double parseSize(String size) {
    if (size.endsWith('px')) {
      return double.parse(size.replaceAll('px', ''));
    }
    return 0.0; // Default size if parsing fails
  }

  // static flutter.Color parseColor(String color) {
  //   return flutter.Color(int.parse(color.replaceAll('#', ''), radix: 16) + 0xFF000000);
  // }

  static flutter.Color parseColor(String color) {
  if (color.length == 6) {
    color = 'FF' + color; // Add opacity if missing
  }
  return flutter.Color(int.parse('0x$color'));
}


  static double parseFontSize(String fontSize) {
    if (fontSize.endsWith('sp')) {
      return double.parse(fontSize.replaceAll('sp', '')).sp;
    }
    return 0.0; // Default font size if parsing fails
  }
}
























// import 'package:flutter/material.dart' as flutter;
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SecondPassParser {
//   static double parseSize(String size) {
//     if (size.endsWith('px')) {
//       return double.parse(size.replaceAll('px', ''));
//     }
//     return 0.0; // Default size if parsing fails
//   }

//   static flutter.Color parseColor(String color) {
//     return flutter.Color(int.parse(color.replaceAll('#', ''), radix: 16) + 0xFF000000);
//   }

//   static double parseFontSize(String fontSize) {
//     if (fontSize.endsWith('sp')) {
//       return double.parse(fontSize.replaceAll('sp', '')).sp;
//     }
//     return 0.0; // Default font size if parsing fails
//   }
// }