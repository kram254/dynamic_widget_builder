import 'package:xml/xml.dart';
import '../models/widget_description.dart';


class XmlParser {
  static WidgetDescription parse(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final root = document.rootElement;
    return _parseElement(root);
  }

  static WidgetDescription _parseElement(XmlElement element) {
  final type = element.name.local;
  final properties = <String, dynamic>{};
  print("Parsing element: $type");

  for (var attribute in element.attributes) {
    properties[attribute.name.local] = attribute.value;
    print(" - Attribute: ${attribute.name.local} = ${attribute.value}");
  }

  final children = element.children.whereType<XmlElement>().toList();
  if (children.isNotEmpty) {
    if (children.length == 1 && children[0].name.local != 'children') {
      properties['child'] = _parseElement(children[0]).toJson();
    } else {
      properties['children'] = children
          .where((child) => child.name.local != 'children')
          .map((child) => _parseElement(child).toJson())
          .toList();
    }
  }
  
  print("Parsed properties: $properties");
  return WidgetDescription(type: type, properties: properties);
}





































  // static WidgetDescription _parseElement(XmlElement element) {
  //   final type = element.name.local;
  //   final properties = <String, dynamic>{};

  //   for (var attribute in element.attributes) {
  //     properties[attribute.name.local] = attribute.value;
  //   }

  //   final children = element.children.whereType<XmlElement>().toList();
  //   if (children.isNotEmpty) {
  //     if (children.length == 1 && children[0].name.local != 'children') {
  //       properties['child'] = _parseElement(children[0]).toJson();
  //     } else {
  //       properties['children'] = children
  //           .where((child) => child.name.local != 'children')
  //           .map((child) => _parseElement(child).toJson())
  //           .toList();
  //     }
  //   }

  //   return WidgetDescription(type: type, properties: properties);
  // }
}





































// import 'package:xml/xml.dart';
// import '../models/widget_description.dart';

// class XmlParser {
//   static WidgetDescription parse(String xmlString) {
//     final document = XmlDocument.parse(xmlString);
//     final root = document.rootElement;
//     return _parseElement(root);
//   }

//   static WidgetDescription _parseElement(XmlElement element) {
//     final type = element.name.local;
//     final properties = <String, dynamic>{};

//     for (var attribute in element.attributes) {
//       properties[attribute.name.local] = attribute.value;
//     }

//     final children = element.children.whereType<XmlElement>().toList();
//     if (children.isNotEmpty) {
//       if (children.length == 1 && children[0].name.local != 'children') {
//         properties['child'] = _parseElement(children[0]).toJson();
//       } else {
//         properties['children'] = children
//             .where((child) => child.name.local != 'children')
//             .map((child) => _parseElement(child).toJson())
//             .toList();
//       }
//     }

//     return WidgetDescription(type: type, properties: properties);
//   }
// }

















































// import 'package:xml/xml.dart' as xml;
// import 'package:flutter/material.dart';
// import 'package:dynamic_widget_builder/src/parsers/xml_to_json_converter.dart';
// import 'package:dynamic_widget_builder/src/parsers/json_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/second_pass_parser.dart';

// class DynamicXmlParser {
//   /// Entry method to parse XML and convert to a Flutter widget
//   Widget parseXml(String xmlString) {
//     try {
//       // Convert XML to JSON first
//       final converter = XmlToJsonConverter();
//       final jsonString = converter.convertXmlToJson(xmlString);

//       // Parse the JSON string into a widget description object
//       final widgetDescription = JsonParser.parse(jsonString);

//       // Build the Flutter widget from the widget description
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       return Center(child: Text("Error parsing XML: $e"));
//     }
//   }

//   // The original XML parsing logic remains available for cases where you might need direct XML parsing
//   Widget _buildWidgetFromXml(xml.XmlElement element) {
//     switch (element.name.local) {
//       case 'Text':
//         return Text(
//           element.getAttribute('text') ?? element.innerText,
//           style: TextStyle(
//             color: _parseColor(element.getAttribute('color')),
//             fontSize: _parseDouble(element.getAttribute('fontSize')),
//           ),
//         );
//       case 'Column':
//         return Column(
//           children: _parseChildren(element),
//         );
//       case 'Row':
//         return Row(
//           children: _parseChildren(element),
//         );
//       case 'Container':
//         return Container(
//           color: _parseColor(element.getAttribute('color')),
//           padding: _parseEdgeInsets(element.getAttribute('padding')),
//           margin: _parseEdgeInsets(element.getAttribute('margin')),
//           child: _parseSingleChild(element) ?? Container(),
//         );
//       case 'Padding':
//         return Padding(
//           padding: _parseEdgeInsets(element.getAttribute('padding')) ?? EdgeInsets.all(0),
//           child: _parseSingleChild(element) ?? Container(),
//         );
//       case 'Image':
//         return Image.network(
//           element.getAttribute('src') ?? '',
//           height: _parseDouble(element.getAttribute('height')),
//           width: _parseDouble(element.getAttribute('width')),
//           fit: _parseBoxFit(element.getAttribute('fit')),
//         );
//       case 'Scaffold':
//         return Scaffold(
//           appBar: _parseSingleChild(element, tag: 'AppBar') as PreferredSizeWidget?,
//           body: _parseSingleChild(element, tag: 'body') ?? Container(),
//           floatingActionButton: _parseSingleChild(element, tag: 'FloatingActionButton'),
//         );
//       case 'AppBar':
//         return AppBar(
//           title: _parseSingleChild(element, tag: 'Text') ?? Container(),
//         );
//       case 'ElevatedButton':
//         return ElevatedButton(
//           onPressed: () {},
//           child: _parseSingleChild(element) ?? Container(),
//         );
//       case 'Center':
//         return Center(
//           child: _parseSingleChild(element) ?? Container(),
//         );
//       case 'SizedBox':
//         return SizedBox(
//           height: _parseDouble(element.getAttribute('height')),
//           width: _parseDouble(element.getAttribute('width')),
//           child: _parseSingleChild(element) ?? Container(),
//         );
//       case 'Align':
//         return Align(
//           alignment: _parseAlignment(element.getAttribute('alignment')) ?? Alignment.center,
//           child: _parseSingleChild(element) ?? Container(),
//         );
//       case 'Stack':
//         return Stack(
//           children: _parseChildren(element),
//         );
//       case 'ListView':
//         return ListView(
//           children: _parseChildren(element),
//         );
//       case 'Expanded':
//         return Expanded(
//           child: _parseSingleChild(element) ?? SizedBox.shrink(),
//         );
//       case 'Flexible':
//         return Flexible(
//           child: _parseSingleChild(element) ?? SizedBox.shrink(),
//         );
//       case 'Positioned':
//         return Positioned(
//           left: _parseDouble(element.getAttribute('left')),
//           right: _parseDouble(element.getAttribute('right')),
//           top: _parseDouble(element.getAttribute('top')),
//           bottom: _parseDouble(element.getAttribute('bottom')),
//           child: _parseSingleChild(element) ?? SizedBox.shrink(),
//         );
//       default:
//         if (element.name.local == 'children') {
//           return Column(
//             children: _parseChildren(element),
//           );
//         }
//         return Container(); // Fallback for unsupported elements
//     }
//   }

//   /// Helper method to parse a single child element
//   Widget? _parseSingleChild(xml.XmlElement element, {String? tag}) {
//     xml.XmlElement? childElement;

//     if (tag != null) {
//       for (final e in element.children.whereType<xml.XmlElement>()) {
//         if (e.name.local == tag) {
//           childElement = e;
//           break;
//         }
//       }
//     } else if (element.children.whereType<xml.XmlElement>().isNotEmpty) {
//       childElement = element.children.whereType<xml.XmlElement>().first;
//     }

//     return childElement != null ? _buildWidgetFromXml(childElement) : null;
//   }

//   /// Parsing children
//   List<Widget> _parseChildren(xml.XmlElement element) {
//     return element.children.whereType<xml.XmlElement>().map((e) => _buildWidgetFromXml(e) ?? Container()).toList();
//   }

//   /// Parsing utility methods
//   Color? _parseColor(String? colorString) {
//     if (colorString == null || colorString.isEmpty) return null;
//     return Color(int.parse('0xFF${colorString.toUpperCase()}'));
//   }

//   EdgeInsets? _parseEdgeInsets(String? paddingString) {
//     if (paddingString == null) return null;
//     final values = paddingString.split(',').map((e) => double.tryParse(e) ?? 0).toList();
//     if (values.length == 4) {
//       return EdgeInsets.fromLTRB(values[0], values[1], values[2], values[3]);
//     }
//     return null;
//   }

//   double? _parseDouble(String? value) {
//     if (value == null) return null;
//     return double.tryParse(value);
//   }

//   BoxFit? _parseBoxFit(String? value) {
//     switch (value) {
//       case 'contain':
//         return BoxFit.contain;
//       case 'cover':
//         return BoxFit.cover;
//       case 'fill':
//         return BoxFit.fill;
//       case 'fitWidth':
//         return BoxFit.fitWidth;
//       case 'fitHeight':
//         return BoxFit.fitHeight;
//       default:
//         return null;
//     }
//   }

//   Alignment? _parseAlignment(String? alignmentString) {
//     switch (alignmentString) {
//       case 'topLeft':
//         return Alignment.topLeft;
//       case 'topCenter':
//         return Alignment.topCenter;
//       case 'topRight':
//         return Alignment.topRight;
//       case 'centerLeft':
//         return Alignment.centerLeft;
//       case 'center':
//         return Alignment.center;
//       case 'centerRight':
//         return Alignment.centerRight;
//       case 'bottomLeft':
//         return Alignment.bottomLeft;
//       case 'bottomCenter':
//         return Alignment.bottomCenter;
//       case 'bottomRight':
//         return Alignment.bottomRight;
//       default:
//         return null;
//     }
//   }
// }





























































// import 'package:xml/xml.dart' as xml;
// import 'package:flutter/material.dart';
// import 'package:dynamic_widget_builder/src/parsers/xml_to_json_converter.dart';
// import 'package:dynamic_widget_builder/src/parsers/json_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/second_pass_parser.dart';

// class DynamicXmlParser {
//   /// Entry method to parse XML and convert to a Flutter widget
//   Widget parseXml(String xmlString) {
//     try {
//       // Convert XML to JSON first
//       final converter = XmlToJsonConverter();
//       final jsonString = converter.convertXmlToJson(xmlString);

//       // Parse the JSON string into a widget description object
//       final widgetDescription = JsonParser.parse(jsonString);

//       // Build the Flutter widget from the widget description
//       return SecondPassParser.buildWidget(widgetDescription);
//     } catch (e) {
//       return Center(child: Text("Error parsing XML: $e"));
//     }
//   }

//   // The original XML parsing logic remains available for cases where you might need direct XML parsing
//   Widget _buildWidgetFromXml(xml.XmlElement element) {
//     switch (element.name.local) {
//       case 'Text':
//         return Text(
//           element.getAttribute('text') ?? element.innerText,
//           style: TextStyle(
//             color: _parseColor(element.getAttribute('color')),
//             fontSize: _parseDouble(element.getAttribute('fontSize')),
//           ),
//         );
//       case 'Column':
//         return Column(
//           children: _parseChildren(element),
//         );
//       case 'Row':
//         return Row(
//           children: _parseChildren(element),
//         );
//       case 'Container':
//         return Container(
//           color: _parseColor(element.getAttribute('color')),
//           padding: _parseEdgeInsets(element.getAttribute('padding')),
//           margin: _parseEdgeInsets(element.getAttribute('margin')),
//           child: element.children.whereType<xml.XmlElement>().isNotEmpty
//               ? _buildWidgetFromXml(element.children.whereType<xml.XmlElement>().first)
//               : null,
//         );
//       case 'Padding':
//         return Padding(
//           padding: _parseEdgeInsets(element.getAttribute('padding')) ?? EdgeInsets.all(0),
//           child: element.children.whereType<xml.XmlElement>().isNotEmpty
//               ? _buildWidgetFromXml(element.children.whereType<xml.XmlElement>().first)
//               : null,
//         );
//       case 'Image':
//         return Image.network(
//           element.getAttribute('src') ?? '',
//           height: _parseDouble(element.getAttribute('height')),
//           width: _parseDouble(element.getAttribute('width')),
//           fit: _parseBoxFit(element.getAttribute('fit')),
//         );
//       case 'Scaffold':
//         return Scaffold(
//           appBar: element.children.whereType<xml.XmlElement>().any((e) => e.name.local == 'AppBar')
//               ? _buildAppBar(element.children.whereType<xml.XmlElement>().firstWhere((e) => e.name.local == 'AppBar'))
//               : null,
//           body: element.children.whereType<xml.XmlElement>().any((e) => e.name.local == 'body')
//               ? _buildWidgetFromXml(element.children.whereType<xml.XmlElement>().firstWhere((e) => e.name.local == 'body'))
//               : null,
//           floatingActionButton: element.children.whereType<xml.XmlElement>().any((e) => e.name.local == 'FloatingActionButton')
//               ? _buildWidgetFromXml(element.children.whereType<xml.XmlElement>().firstWhere((e) => e.name.local == 'FloatingActionButton'))
//               : null,
//         );
//       case 'AppBar':
//         return AppBar(
//           title: element.children.whereType<xml.XmlElement>().any((e) => e.name.local == 'Text')
//               ? _buildWidgetFromXml(element.children.whereType<xml.XmlElement>().firstWhere((e) => e.name.local == 'Text'))
//               : null,
//         );
//       case 'ElevatedButton':
//         return ElevatedButton(
//           onPressed: () {},
//           child: element.children.whereType<xml.XmlElement>().isNotEmpty
//               ? _buildWidgetFromXml(element.children.whereType<xml.XmlElement>().first)
//               : null,
//         );
//       case 'Center':
//         return Center(
//           child: element.children.whereType<xml.XmlElement>().isNotEmpty
//               ? _buildWidgetFromXml(element.children.whereType<xml.XmlElement>().first)
//               : null,
//         );
//       case 'children':
//         return Column(
//           children: _parseChildren(element),
//         );
//       default:
//         return Container(); // Fallback for unsupported elements
//     }
//   }

//   /// Helper to build AppBar
//   PreferredSizeWidget? _buildAppBar(xml.XmlElement element) {
//     final widget = _buildWidgetFromXml(element);
//     if (widget is PreferredSizeWidget) {
//       return widget;
//     }
//     return null;
//   }

//   /// Parsing children
//   List<Widget> _parseChildren(xml.XmlElement element) {
//     return element.children.whereType<xml.XmlElement>().map(_buildWidgetFromXml).toList();
//   }

//   /// Parsing utility methods
//   Color? _parseColor(String? colorString) {
//     if (colorString == null || colorString.isEmpty) return null;
//     return Color(int.parse('0xFF${colorString.toUpperCase()}'));
//   }

//   EdgeInsets? _parseEdgeInsets(String? paddingString) {
//     if (paddingString == null) return null;
//     final values = paddingString.split(',').map((e) => double.tryParse(e) ?? 0).toList();
//     if (values.length == 4) {
//       return EdgeInsets.fromLTRB(values[0], values[1], values[2], values[3]);
//     }
//     return null;
//   }

//   double? _parseDouble(String? value) {
//     if (value == null) return null;
//     return double.tryParse(value);
//   }

//   BoxFit? _parseBoxFit(String? value) {
//     switch (value) {
//       case 'contain':
//         return BoxFit.contain;
//       case 'cover':
//         return BoxFit.cover;
//       case 'fill':
//         return BoxFit.fill;
//       case 'fitWidth':
//         return BoxFit.fitWidth;
//       case 'fitHeight':
//         return BoxFit.fitHeight;
//       default:
//         return null;
//     }
//   }

//   Alignment? _parseAlignment(String? alignmentString) {
//     switch (alignmentString) {
//       case 'topLeft':
//         return Alignment.topLeft;
//       case 'topCenter':
//         return Alignment.topCenter;
//       case 'topRight':
//         return Alignment.topRight;
//       case 'centerLeft':
//         return Alignment.centerLeft;
//       case 'center':
//         return Alignment.center;
//       case 'centerRight':
//         return Alignment.centerRight;
//       case 'bottomLeft':
//         return Alignment.bottomLeft;
//       case 'bottomCenter':
//         return Alignment.bottomCenter;
//       case 'bottomRight':
//         return Alignment.bottomRight;
//       default:
//         return null;
//     }
//   }
// }

