import 'package:json_annotation/json_annotation.dart';

part 'widget_description.g.dart';

@JsonSerializable()
class WidgetDescription {
  final String type;
  final Map<String, dynamic> properties;

  WidgetDescription({required this.type, required this.properties});

  factory WidgetDescription.fromJson(Map<String, dynamic> json) =>
      _$WidgetDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetDescriptionToJson(this);
}































// class WidgetDescription {
//   final String type;
//   final Map<String, dynamic> properties;

//   WidgetDescription({required this.type, required this.properties});

//   factory WidgetDescription.fromJson(Map<String, dynamic> json) {
//     return WidgetDescription(
//       type: json['type'],
//       properties: json['properties'],
//     );
//   }
// }