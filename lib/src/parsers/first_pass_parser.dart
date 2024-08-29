// import 'package:flutter/material.dart';
// import 'package:xml/xml.dart';
// import '../models/widget_description.dart';
// import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart' as wb;

// class FirstPassParser {
//   static WidgetDescription parse(String xmlString) {
//     final document = XmlDocument.parse(xmlString);
//     return _parseElement(document.rootElement);
//   }

//   static WidgetDescription _parseElement(XmlElement element) {
//     final properties = <String, dynamic>{};
//     for (var attribute in element.attributes) {
//       properties[attribute.name.toString()] = attribute.value;
//     }

//     final children = <WidgetDescription>[];
//     for (var childElement in element.childElements) {
//       children.add(_parseElement(childElement));
//     }

//     return WidgetDescription(
//       type: element.name.toString(),
//       properties: properties,
//       children: children,
//     );
//   }

//   static List<Widget> parseChildren(List<dynamic>? children) {
//     if (children == null) return [];
//     return children.map((child) {
//       if (child is WidgetDescription) {
//         return wb.WidgetBuilder.buildWidget(child);
//       } else if (child is Map<String, dynamic>) {
//         return wb.WidgetBuilder.buildWidget(WidgetDescription.fromJson(child));
//       } else {
//         print('Warning: Unsupported child type, returning SizedBox.shrink()');
//         return SizedBox.shrink();
//       }
//     }).toList();
//   }
// }



































// import 'package:flutter/material.dart';
// import 'package:xml/xml.dart';
// import '../models/widget_description.dart';
// import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart' as wb;

// class FirstPassParser {
//   static WidgetDescription parse(String xmlString) {
//     try {
//       final document = XmlDocument.parse(xmlString);
//       return _parseElement(document.rootElement);
//     } catch (e) {
//       print('Error parsing XML during the first pass: $e');
//       throw e;
//     }
//   }

//   static WidgetDescription _parseElement(XmlElement element) {
//     // Convert attributes to properties
//     final properties = Map<String, dynamic>.fromIterable(
//       element.attributes,
//       key: (attr) => attr.name.local,
//       value: (attr) => attr.value,
//     );

//     final children = <WidgetDescription>[];

//     // Recursively parse child elements
//     for (var childElement in element.childElements) {
//       if (childElement.name.local == 'children') {
//         childElement.childElements.forEach((grandChildElement) {
//           children.add(_parseElement(grandChildElement));
//         });
//       } else {
//         children.add(_parseElement(childElement));
//       }
//     }

//     return WidgetDescription(
//       type: element.name.local,
//       properties: properties,
//       children: children,
//     );
//   }

//   static List<Widget> parseChildren(List<dynamic>? children) {
//     if (children == null) {
//       print('Warning: children is null. Using an empty list instead.');
//       children = [];
//     }

//     return children.map((child) {
//       if (child is WidgetDescription) {
//         return wb.WidgetBuilder.buildWidget(child);
//       } else if (child is Map<String, dynamic>) {
//         return wb.WidgetBuilder.buildWidget(WidgetDescription.fromJson(child));
//       }
//       print('Warning: Unsupported type encountered. Returning SizedBox.shrink().');
//       return SizedBox.shrink(); // Fallback for unsupported types
//     }).toList();
//   }
// }
































// import 'package:flutter/material.dart';
// import 'package:xml/xml.dart';
// import '../models/widget_description.dart';
// import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart' as wb;

// class FirstPassParser {
//   static WidgetDescription parse(String xmlString) {
//     final document = XmlDocument.parse(xmlString);
//     return _parseElement(document.rootElement);
//   }

//   static WidgetDescription _parseElement(XmlElement element) {
//     final properties = Map<String, dynamic>.fromIterable(
//       element.attributes,
//       key: (attr) => attr.name.toString(),
//       value: (attr) => attr.value,
//     );

//     final children = <WidgetDescription>[];
//     element.childElements.forEach((childElement) {
//       if (childElement.name.toString() == 'children') {
//         childElement.childElements.forEach((grandChildElement) {
//           children.add(_parseElement(grandChildElement));
//         });
//       } else {
//         children.add(_parseElement(childElement));
//       }
//     });

//     return WidgetDescription(
//       type: element.name.toString(),
//       properties: properties,
//       children: children,
//     );
//   }

//   static List<Widget> parseChildren(List<dynamic>? children) {
//     // Debug message to log if children is null
//     if (children == null) {
//       print('Warning: children is null. Using an empty list instead.');
//       children = [];
//     }

//     return children.map((child) {
//       if (child is WidgetDescription) {
//         return wb.WidgetBuilder.buildWidget(child);
//       } else if (child is Map<String, dynamic>) {
//         return wb.WidgetBuilder.buildWidget(WidgetDescription.fromJson(child));
//       }
//       // Debug message to log if an unsupported type is encountered
//       print('Warning: Unsupported type encountered. Returning SizedBox.shrink().');
//       return SizedBox.shrink(); // Fallback for unsupported types
//     }).toList();
//   }
// }

