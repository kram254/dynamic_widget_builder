import 'package:json_annotation/json_annotation.dart';

part 'widget_description.g.dart';

@JsonSerializable(explicitToJson: true)
class WidgetDescription {
  final String type;
  final Map<String, dynamic> properties;

  WidgetDescription({required this.type, required this.properties});

  factory WidgetDescription.fromJson(Map<String, dynamic> json) =>
      _$WidgetDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetDescriptionToJson(this);
}















// import 'package:json_annotation/json_annotation.dart';

// part 'widget_description.g.dart';

// @JsonSerializable(explicitToJson: true)
// class WidgetDescription {
//   final String type;
//   final Map<String, dynamic> properties;
//   final List<WidgetDescription>? children;

//   WidgetDescription({
//     required this.type,
//     required this.properties,
//     this.children,
//   });

//   factory WidgetDescription.fromJson(Map<String, dynamic> json) =>
//       _$WidgetDescriptionFromJson(json);

//   Map<String, dynamic> toJson() => _$WidgetDescriptionToJson(this);
// }












































// import 'package:json_annotation/json_annotation.dart';

// part 'widget_description.g.dart';

// @JsonSerializable()
// class WidgetDescription {
//   final String type;
//   final Map<String, dynamic> properties;
//   @JsonKey(defaultValue: <WidgetDescription>[])
//   final List<WidgetDescription> children;

//   WidgetDescription({
//     required this.type,
//     required this.properties,
//     required this.children,
//   });

//   factory WidgetDescription.fromJson(Map<String, dynamic> json) =>
//       _$WidgetDescriptionFromJson(json);

//   Map<String, dynamic> toJson() => _$WidgetDescriptionToJson(this);
// }