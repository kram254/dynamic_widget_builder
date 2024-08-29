import 'package:flutter/material.dart';
import '../models/widget_description.dart';

typedef WidgetBuilderFunction = Widget Function(Map<String, dynamic> properties);

class WidgetBuilder {
  static final Map<String, WidgetBuilderFunction> _customBuilders = {};

  static void registerCustomBuilder(String type, WidgetBuilderFunction builder) {
    _customBuilders[type] = builder;
  }

  static Widget build(WidgetDescription description) {
    // Check if the widget type has a custom builder registered
    if (_customBuilders.containsKey(description.type)) {
      return _customBuilders[description.type]!(description.properties);
    }

    switch (description.type) {
      case 'Text':
        return _buildText(description.properties);
      case 'Container':
        return _buildContainer(description.properties);
      case 'Column':
        return _buildColumn(description.properties);
      case 'Row':
        return _buildRow(description.properties);
      case 'SizedBox':
        return _buildSizedBox(description.properties);
      case 'Padding':
        return _buildPadding(description.properties);
      case 'Center':
        return _buildCenter(description.properties);
      case 'Expanded':
        return _buildExpanded(description.properties);
      case 'Scaffold':
        return _buildScaffold(description.properties);
      case 'AppBar':
        return _buildAppBar(description.properties);
      // Add additional widgets here
      default:
        throw Exception('Unsupported widget type: ${description.type}');
    }
  }


  static Widget _buildText(Map<String, dynamic> properties) {
    TextStyle? style;
    if (properties['style'] != null) {
      final styleProps = properties['style'] as Map<String, dynamic>;
      style = TextStyle(
        color: _parseColor(styleProps['color']),
        fontSize: double.tryParse(styleProps['fontSize']?.toString() ?? ''),
        fontWeight: _parseFontWeight(styleProps['fontWeight']),
        fontFamily: styleProps['fontFamily'],
        letterSpacing: double.tryParse(styleProps['letterSpacing']?.toString() ?? ''),
        // Add more style properties as needed
      );
    }
    return Text(
      properties['text'] ?? '',
      style: style,
    );
}

static FontWeight? _parseFontWeight(String? fontWeight) {
    switch (fontWeight?.toLowerCase()) {
        case 'bold':
            return FontWeight.bold;
        case 'normal':
            return FontWeight.normal;
        case 'w500':
            return FontWeight.w500;
        // Add other weights as necessary
        default:
            return null;
    }
}



  // static Widget _buildText(Map<String, dynamic> properties) {
  //   return Text(
  //     properties['text'] ?? '',
  //     style: TextStyle(
  //       color: _parseColor(properties['color']),
  //       fontSize: double.tryParse(properties['fontSize']?.toString() ?? ''),
  //     ),
  //   );
  // }

  static Widget _buildContainer(Map<String, dynamic> properties) {
    return Container(
      color: _parseColor(properties['color']),
      padding: _parsePadding(properties['padding']),
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildColumn(Map<String, dynamic> properties) {
    return Column(
      children: _buildChildren(properties['children']),
    );
  }

  static Widget _buildRow(Map<String, dynamic> properties) {
    return Row(
      children: _buildChildren(properties['children']),
    );
  }

  static Widget _buildSizedBox(Map<String, dynamic> properties) {
    return SizedBox(
      width: double.tryParse(properties['width']?.toString() ?? ''),
      height: double.tryParse(properties['height']?.toString() ?? ''),
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildPadding(Map<String, dynamic> properties) {
    return Padding(
      padding: _parsePadding(properties['padding']) ?? EdgeInsets.zero,
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildCenter(Map<String, dynamic> properties) {
    return Center(
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildExpanded(Map<String, dynamic> properties) {
    return Expanded(
      flex: int.tryParse(properties['flex']?.toString() ?? '1') ?? 1,
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : Container(),
    );
  }

static Widget _buildScaffold(Map<String, dynamic> properties) {
  return Scaffold(
    appBar: properties['appBar'] != null
        ? _buildAppBar(properties['appBar']) as PreferredSizeWidget?
        : null,
    body: properties['body'] != null
        ? build(WidgetDescription.fromJson(properties['body']))
        : null,
    floatingActionButton: properties['floatingActionButton'] != null
        ? build(WidgetDescription.fromJson(properties['floatingActionButton']))
        : null,
  );
}


  static Widget _buildAppBar(Map<String, dynamic> properties) {
    return AppBar(
      title: properties['title'] != null
          ? build(WidgetDescription.fromJson(properties['title']))
          : null,
    );
  }

  static List<Widget> _buildChildren(List<dynamic>? children) {
    return children
            ?.map((child) => build(WidgetDescription.fromJson(child)))
            .toList() ??
        [];
  }

  static Color? _parseColor(String? colorString) {
    if (colorString == null) return null;
    if (colorString.startsWith('#')) {
      colorString = colorString.substring(1);
    }
    return Color(int.parse('0xFF$colorString'));
  }

  static EdgeInsets? _parsePadding(String? paddingString) {
    if (paddingString == null) return null;
    final parts = paddingString.split(',').map(double.parse).toList();
    if (parts.length == 4) {
      return EdgeInsets.fromLTRB(parts[0], parts[1], parts[2], parts[3]);
    }
    return null;
  }
}










































// import 'package:flutter/material.dart';
// import '../models/widget_description.dart';

// class WidgetBuilder {
//   static Widget build(WidgetDescription description) {
//     switch (description.type) {
//       case 'Text':
//         return _buildText(description.properties);
//       case 'Container':
//         return _buildContainer(description.properties);
//       case 'Column':
//         return _buildColumn(description.properties);
//       case 'Row':
//         return _buildRow(description.properties);
//       case 'SizedBox':
//         return _buildSizedBox(description.properties);
//       case 'Padding':
//         return _buildPadding(description.properties);
//       case 'Center':
//         return _buildCenter(description.properties);
//       case 'Expanded':
//         return _buildExpanded(description.properties);
//       default:
//         throw Exception('Unsupported widget type: ${description.type}');
//     }
//   }

//   static Widget _buildText(Map<String, dynamic> properties) {
//     return Text(
//       properties['text'] ?? '',
//       style: TextStyle(
//         color: _parseColor(properties['color']),
//         fontSize: double.tryParse(properties['fontSize']?.toString() ?? ''),
//       ),
//     );
//   }

//   static Widget _buildContainer(Map<String, dynamic> properties) {
//     return Container(
//       color: _parseColor(properties['color']),
//       padding: _parsePadding(properties['padding']),
//       child: properties['child'] != null
//           ? build(WidgetDescription.fromJson(properties['child']))
//           : null,
//     );
//   }

//   static Widget _buildColumn(Map<String, dynamic> properties) {
//     return Column(
//       children: _buildChildren(properties['children']),
//     );
//   }

//   static Widget _buildRow(Map<String, dynamic> properties) {
//     return Row(
//       children: _buildChildren(properties['children']),
//     );
//   }

//   static Widget _buildSizedBox(Map<String, dynamic> properties) {
//     return SizedBox(
//       width: double.tryParse(properties['width']?.toString() ?? ''),
//       height: double.tryParse(properties['height']?.toString() ?? ''),
//       child: properties['child'] != null
//           ? build(WidgetDescription.fromJson(properties['child']))
//           : null,
//     );
//   }

//   static Widget _buildPadding(Map<String, dynamic> properties) {
//     return Padding(
//       padding: _parsePadding(properties['padding']) ?? EdgeInsets.zero,
//       child: properties['child'] != null
//           ? build(WidgetDescription.fromJson(properties['child']))
//           : null,
//     );
//   }

//   static Widget _buildCenter(Map<String, dynamic> properties) {
//     return Center(
//       child: properties['child'] != null
//           ? build(WidgetDescription.fromJson(properties['child']))
//           : null,
//     );
//   }

//   static Widget _buildExpanded(Map<String, dynamic> properties) {
//     return Expanded(
//       flex: int.tryParse(properties['flex']?.toString() ?? '1') ?? 1,
//       child: properties['child'] != null
//           ? build(WidgetDescription.fromJson(properties['child']))
//           : Container(),
//     );
//   }

//   static List<Widget> _buildChildren(List<dynamic>? children) {
//     return children
//             ?.map((child) => build(WidgetDescription.fromJson(child)))
//             .toList() ??
//         [];
//   }

//   static Color? _parseColor(String? colorString) {
//     if (colorString == null) return null;
//     if (colorString.startsWith('#')) {
//       colorString = colorString.substring(1);
//     }
//     return Color(int.parse('0xFF$colorString'));
//   }

//   static EdgeInsets? _parsePadding(String? paddingString) {
//     if (paddingString == null) return null;
//     final parts = paddingString.split(',').map(double.parse).toList();
//     if (parts.length == 4) {
//       return EdgeInsets.fromLTRB(parts[0], parts[1], parts[2], parts[3]);
//     }
//     return null;
//   }
// }


































// import 'package:dynamic_widget_builder/src/models/widget_description.dart';
// import 'package:dynamic_widget_builder/src/parsers/first_pass_parser.dart';
// import 'package:dynamic_widget_builder/src/parsers/second_pass_parser.dart';
// import 'package:dynamic_widget_builder/src/utils/parsing_utils.dart';
// import 'package:flutter/material.dart' as flutter;

// class WidgetBuilder {
//   static flutter.Widget buildWidget(WidgetDescription description) {
//     switch (description.type) {
//       case 'Container':
//         return _buildContainer(description);
//       case 'Column':
//         return _buildColumn(description);
//       case 'Row':
//         return _buildRow(description);
//       case 'Card':
//         return _buildCard(description);
//       case 'Text':
//         return _buildText(description);
//       case 'Image':
//         return _buildImage(description);
//       case 'ListView':
//         return _buildListView(description);
//       case 'Stack':
//         return _buildStack(description);
//       case 'Expanded':
//         return _buildExpanded(description);
//       case 'Padding':
//         return _buildPadding(description);
//       case 'Center':
//         return _buildCenter(description);
//       case 'Align':
//         return _buildAlign(description);
//       case 'SizedBox':
//         return _buildSizedBox(description);
//       case 'Scaffold':
//         return _buildScaffold(description);
//       case 'AppBar':
//         return _buildAppBar(description);
//       case 'TextField':
//         return _buildTextField(description);
//       case 'ElevatedButton':
//         return _buildElevatedButton(description);
//       case 'Icon':
//         return _buildIcon(description);
//       case 'IconButton':
//         return _buildIconButton(description);
//       case 'FloatingActionButton':
//         return _buildFloatingActionButton(description);
//       default:
//         return flutter.Container();
//     }
//   }

//   static flutter.Widget _buildContainer(WidgetDescription description) {
//     return flutter.Container(
//       height: ParsingUtils.parseSize(description.properties['height']),
//       width: ParsingUtils.parseSize(description.properties['width']),
//       color: ParsingUtils.parseColor(description.properties['color']),
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : null,
//     );
//   }

//   static flutter.Widget _buildColumn(WidgetDescription description) {
//     List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
//     return flutter.Column(
//       children: children,
//     );
//   }

//   static flutter.Widget _buildRow(WidgetDescription description) {
//     List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
//     return flutter.Row(
//       children: children,
//     );
//   }

//   static flutter.Widget _buildCard(WidgetDescription description) {
//     return flutter.Card(
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : null,
//     );
//   }

//   static flutter.Widget _buildText(WidgetDescription description) {
//     return flutter.Text(
//       description.properties['data'],
//       style: flutter.TextStyle(fontSize: ParsingUtils.parseFontSize(description.properties['fontSize'])),
//     );
//   }

//   static flutter.Widget _buildImage(WidgetDescription description) {
//     return flutter.Image.network(
//       description.properties['url'],
//     );
//   }

//   static flutter.Widget _buildListView(WidgetDescription description) {
//     List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
//     return flutter.ListView(
//       shrinkWrap: true, // Ensure ListView takes only the space it needs
//       children: children,
//     );
//   }

//   static flutter.Widget _buildStack(WidgetDescription description) {
//     List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
//     return flutter.Stack(
//       children: children,
//     );
//   }

//   static flutter.Widget _buildExpanded(WidgetDescription description) {
//     return flutter.Expanded(
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : flutter.Container(),
//     );
//   }

//   static flutter.Widget _buildPadding(WidgetDescription description) {
//   double? paddingValue = ParsingUtils.parseSize(description.properties['padding']);
//   return flutter.Padding(
//     padding: flutter.EdgeInsets.all(paddingValue ?? 0.0), 
//     child: description.properties['child'] != null
//         ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//         : null,
//   );
// }


//   static flutter.Widget _buildCenter(WidgetDescription description) {
//     return flutter.Center(
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : null,
//     );
//   }

//   static flutter.Widget _buildAlign(WidgetDescription description) {
//     return flutter.Align(
//       alignment: _parseAlignment(description.properties['alignment']),
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : null,
//     );
//   }

//   static flutter.Alignment _parseAlignment(String alignment) {
//     switch (alignment) {
//       case 'topLeft':
//         return flutter.Alignment.topLeft;
//       case 'topCenter':
//         return flutter.Alignment.topCenter;
//       case 'topRight':
//         return flutter.Alignment.topRight;
//       case 'centerLeft':
//         return flutter.Alignment.centerLeft;
//       case 'center':
//         return flutter.Alignment.center;
//       case 'centerRight':
//         return flutter.Alignment.centerRight;
//       case 'bottomLeft':
//         return flutter.Alignment.bottomLeft;
//       case 'bottomCenter':
//         return flutter.Alignment.bottomCenter;
//       case 'bottomRight':
//         return flutter.Alignment.bottomRight;
//       default:
//         return flutter.Alignment.center;
//     }
//   }

//   static flutter.Widget _buildSizedBox(WidgetDescription description) {
//     return flutter.SizedBox(
//       height: ParsingUtils.parseSize(description.properties['height']),
//       width: ParsingUtils.parseSize(description.properties['width']),
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : null,
//     );
//   }

//   static flutter.Widget _buildScaffold(WidgetDescription description) {
//     return flutter.Scaffold(
//       appBar: description.properties['appBar'] != null
//           ? _buildAppBar(WidgetDescription.fromJson(description.properties['appBar'])) as flutter.PreferredSizeWidget?
//           : null,
//       body: description.properties['body'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['body']))
//           : null,
//       floatingActionButton: description.properties['floatingActionButton'] != null
//           ? _buildFloatingActionButton(WidgetDescription.fromJson(description.properties['floatingActionButton']))
//           : null,
//     );
//   }

//   static flutter.Widget _buildAppBar(WidgetDescription description) {
//     return flutter.AppBar(
//       title: description.properties['title'] != null
//           ? _buildText(WidgetDescription.fromJson(description.properties['title']))
//           : null,
//     );
//   }

//   static flutter.Widget _buildTextField(WidgetDescription description) {
//     return flutter.TextField();
//   }

//   static flutter.Widget _buildElevatedButton(WidgetDescription description) {
//     return flutter.ElevatedButton(
//       onPressed: () {},
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : null,
//     );
//   }

//   static flutter.Widget _buildIcon(WidgetDescription description) {
//     return flutter.Icon(
//       _parseIcon(description.properties['icon']),
//       size: ParsingUtils.parseSize(description.properties['size']),
//       color: ParsingUtils.parseColor(description.properties['color']),
//     );
//   }

//   static flutter.IconData _parseIcon(String iconName) {
//     switch (iconName) {
//       case 'add':
//         return flutter.Icons.add;
//       case 'home':
//         return flutter.Icons.home;
//       case 'settings':
//         return flutter.Icons.settings;
//       default:
//         return flutter.Icons.error;
//     }
//   }

//   static flutter.Widget _buildIconButton(WidgetDescription description) {
//     return flutter.IconButton(
//       icon: _buildIcon(WidgetDescription.fromJson({
//         'type': 'Icon',
//         'properties': description.properties['icon'],
//       })),
//       onPressed: () {},
//     );
//   }

//   static flutter.Widget _buildFloatingActionButton(WidgetDescription description) {
//     return flutter.FloatingActionButton(
//       onPressed: () {},
//       child: description.properties['child'] != null
//           ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
//           : null,
//     );
//   }
// }
















