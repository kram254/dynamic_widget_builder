import 'package:dynamic_widget_builder/src/models/widget_description.dart';
import 'package:dynamic_widget_builder/src/parsers/widget_builder.dart';
import 'package:dynamic_widget_builder/src/utils/json_utils.dart';
import 'package:flutter/material.dart' as flutter; // Use a prefix for Flutter imports

class DynamicWidgetBuilder {
  static flutter.Widget parse(String jsonString) {
    final Map<String, dynamic> jsonMap = JsonUtils.parseJson(jsonString);
    final WidgetDescription description = WidgetDescription.fromJson(jsonMap);
    return WidgetBuilderJson.buildWidget(description);
  }
}