import 'package:dynamic_widget_builder/src/models/widget_description.dart';
import 'package:flutter/material.dart' as flutter; 
import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart';

class FirstPassParser {
  static List<flutter.Widget> parseChildren(List<dynamic> childrenJson) {
    return childrenJson.map((childJson) {
      final WidgetDescription childDescription = WidgetDescription.fromJson(childJson);
      return WidgetBuilderJson.buildWidget(childDescription);
    }).toList();
  }
}