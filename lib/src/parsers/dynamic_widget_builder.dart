import 'package:dynamic_widget_builder/src/models/widget_description.dart';
import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart';
import 'package:dynamic_widget_builder/src/parsers/xml_parser.dart';
import 'package:dynamic_widget_builder/src/utils/json_utils.dart';
import 'package:flutter/material.dart' as flutter;

class DynamicWidgetBuilder {
  static flutter.Widget parse(String input) {
    try {
      WidgetDescription description;
      if (input.startsWith('<')) {
        description = XmlParser.parse(input)!;
      } else {
        final Map<String, dynamic> jsonMap = JsonUtils.parseJson(input);
        description = WidgetDescription.fromJson(jsonMap);
      }
      return WidgetBuilder.buildWidget(description);
    } catch (e) {
      // Handle parsing errors
      return flutter.Center(
        child: flutter.Text('Error parsing input: $e'),
      );
    }
  }
}


























// import 'package:dynamic_widget_builder/src/models/widget_description.dart';
// import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart';
// import 'package:dynamic_widget_builder/src/parsers/xml_parser.dart';
// import 'package:dynamic_widget_builder/src/utils/json_utils.dart';
// import 'package:flutter/material.dart' as flutter;

// class DynamicWidgetBuilder {
//   static flutter.Widget parse(String input) {
//     try {
//       WidgetDescription description;
//       if (input.startsWith('<')) {
//         description = XmlParser.parse(input);
//       } else {
//         final Map<String, dynamic> jsonMap = JsonUtils.parseJson(input);
//         description = WidgetDescription.fromJson(jsonMap);
//       }
//       return WidgetBuilder.buildWidget(description);
//     } catch (e) {
//       // Handle parsing errors
//       return flutter.Center(
//         child: flutter.Text('Error parsing input: $e'),
//       );
//     }
//   }
// }
