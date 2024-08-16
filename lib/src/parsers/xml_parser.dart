import 'package:xml/xml.dart' as xml;
import 'package:dynamic_widget_builder/src/models/widget_description.dart';

class XmlParser {
  static WidgetDescription? parse(String xmlString) {
    try {
      final document = xml.XmlDocument.parse(xmlString);
      return _parseElement(document.rootElement);
    } catch (e) {
      print("Error parsing XML: $e");
      return null; 
    }
  }

 static WidgetDescription _parseElement(xml.XmlElement element) {
  Map<String, dynamic> properties = {};

  for (var attribute in element.attributes) {
    properties[attribute.name.local] = attribute.value;
  }

  // Handling children that might be lists
  List<dynamic> children = [];
  for (var child in element.childElements) {
    if (child.childElements.isNotEmpty) {
      // If the child has its own children, treat it as a nested widget
      children.add(_parseElement(child));
    } else {
      // If it's a leaf node (e.g., <Text>content</Text>)
      properties[child.name.local] = child.innerText;
    }
  }

  if (children.isNotEmpty) {
    properties['children'] = children;  // Treat children as a list
  }

  return WidgetDescription(type: element.name.local, properties: properties);
}

}




























// import 'package:xml/xml.dart' as xml;
// import 'package:dynamic_widget_builder/src/models/widget_description.dart';

// class XmlParser {
//   static WidgetDescription parse(String xmlString) {
//     xml.XmlDocument document = xml.XmlDocument.parse(xmlString);
//     return _parseElement(document.rootElement);
//   }

//   static WidgetDescription _parseElement(xml.XmlElement element) {
//     Map<String, dynamic> properties = {};
//     element.children.whereType<xml.XmlElement>().forEach((child) {
//       if (child.children.isNotEmpty && child.children.first is xml.XmlElement) {
//         properties[child.name.local] = _parseElement(child.children.first as xml.XmlElement);
//       } else {
//         properties[child.name.local] = child.text;
//       }
//     });
//     return WidgetDescription(type: element.name.local, properties: properties);
//   }
// }
