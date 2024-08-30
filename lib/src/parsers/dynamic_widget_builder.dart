import 'package:flutter/material.dart';
import 'json_parser.dart';
import 'xml_parser.dart';
import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart' as wd;

class DynamicWidgetBuilder {
  static Widget buildFromJson(String jsonString) {
    try {
      final widgetDescription = JsonParser.parse(jsonString);
      return wd.WidgetBuilder.build(widgetDescription);
    } catch (e, stacktrace) {
      print('Error building widget from JSON: $e');
      print(stacktrace);
      return ErrorWidget('Failed to build widget from JSON');
    }
  }

  static Widget buildFromXml(String xmlString) {
  try {
    final widgetDescription = XmlParser.parse(xmlString);
    print("Parsed XML to WidgetDescription: $widgetDescription");
    return wd.WidgetBuilder.build(widgetDescription);
  } catch (e, stacktrace) {
    print('Error building widget from XML: $e');
    print(stacktrace); 
    return ErrorWidget('Failed to build widget from XML: $e');
  }
}

}



























// import 'package:dynamic_widget_builder/src/parsers/first_pass_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/json_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/second_pass_parser.dart';
// import 'package:flutter/material.dart';

// class DynamicWidgetBuilder {
//   static Widget buildFromXml(String xmlString) {
//     try {
//       print('DynamicWidgetBuilder: Building from XML');
//       final widgetDescription = FirstPassParser.parse(xmlString);
//       print('XML Parsed Structure: ${widgetDescription.toJson()}');
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       print('Error during XML parsing and building: $e');
//       return Center(child: Text('Error rendering XML: $e'));
//     }
//   }

//   static Widget buildFromJson(String jsonString) {
//     try {
//       print('DynamicWidgetBuilder: Building from JSON');
//       final widgetDescription = JsonParser.parse(jsonString);
//       print('JSON Parsed Structure: ${widgetDescription.toJson()}');
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       print('Error during JSON parsing and building: $e');
//       return Center(child: Text('Error rendering JSON: $e'));
//     }
//   }
// }
































// import 'package:dynamic_widget_builder/src/parsers/first_pass_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/json_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/second_pass_parser.dart';
// import 'package:flutter/material.dart';

// import 'xml_to_json_converter.dart';

// class DynamicWidgetBuilder {
//   /// Method to build from XML with XML-to-JSON conversion
//   static Widget buildFromXml(String xmlString) {
//     print('DynamicWidgetBuilder: Building from XML');
//     try {
//       // Convert XML to JSON
//       final converter = XmlToJsonConverter();
//       final jsonString = converter.convertXmlToJson(xmlString);
      
//       if (jsonString == null || jsonString.isEmpty) {
//         throw Exception('Converted JSON string is null or empty');
//       }

//       // Parse the converted JSON string into a widget description object
//       final widgetDescription = JsonParser.parse(jsonString);
//       print('Converted XML to JSON and Parsed Structure: ${widgetDescription.toJson()}');
      
//       // Build and return the Flutter widget using the parsed structure
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       print('Error during XML-to-JSON parsing and building: $e');
//       return Center(child: Text('Error rendering XML: $e'));
//     }
//   }

//   /// Method to build from JSON directly
//   static Widget buildFromJson(String jsonString) {
//     print('DynamicWidgetBuilder: Building from JSON');
//     try {
//       if (jsonString == null || jsonString.isEmpty) {
//         throw Exception('JSON string is null or empty');
//       }

//       final widgetDescription = JsonParser.parse(jsonString);
//       print('JSON Parsed Structure: ${widgetDescription.toJson()}');
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       print('Error during JSON parsing and building: $e');
//       return Center(child: Text('Error rendering JSON: $e'));
//     }
//   }
// }



































// import 'package:dynamic_widget_builder/src/parsers/first_pass_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/json_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/second_pass_parser.dart';
// import 'package:flutter/material.dart';

// class DynamicWidgetBuilder {
//   static Widget buildFromXml(String xmlString) {
//     print('DynamicWidgetBuilder: Building from XML');
//     try {
//       final widgetDescription = FirstPassParser.parse(xmlString);
//       print('XML Parsed Structure: ${widgetDescription.toJson()}');
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       print('Error during XML parsing and building: $e');
//       return Center(child: Text('Error rendering XML: $e'));
//     }
//   }

//   static Widget buildFromJson(String jsonString) {
//     print('DynamicWidgetBuilder: Building from JSON');
//     try {
//       final widgetDescription = JsonParser.parse(jsonString);
//       print('JSON Parsed Structure: ${widgetDescription.toJson()}');
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       print('Error during JSON parsing and building: $e');
//       return Center(child: Text('Error rendering JSON: $e'));
//     }
//   }
// }
