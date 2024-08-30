import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import '../models/widget_description.dart';

typedef WidgetBuilderFunction = Widget Function(
    Map<String, dynamic> properties);

class WidgetBuilder {
  static final Map<String, WidgetBuilderFunction> _customBuilders = {};

  static void registerCustomBuilder(
      String type, WidgetBuilderFunction builder) {
    _customBuilders[type] = builder;
  }

  static Widget build(WidgetDescription description) {

    // Check if the widget type has a custom builder registered
    print('Building widget: ${description.type} with properties: ${description.properties}');


    if (_customBuilders.containsKey(description.type)) {
      return _customBuilders[description.type]!(description.properties);
    }

    try{

    switch (description.type) {
      case 'Text':
        return _buildText(description.properties);
      case 'Container':
        return _buildContainer(description.properties);
      case 'Column':
        return _buildColumn(description.properties);
      case 'Row':
        return _buildRow(description.properties);
      case 'Stack':
        return _buildStack(description.properties);
      case 'ListView':
        return _buildListView(description.properties);
      case 'GridView':
        return _buildGridView(description.properties);
      case 'Expanded':
        return _buildExpanded(description.properties);
      case 'Padding':
        return _buildPadding(description.properties);
      case 'Center':
        return _buildCenter(description.properties);
      case 'Align':
        return _buildAlign(description.properties);
      case 'SizedBox':
        return _buildSizedBox(description.properties);
      case 'AspectRatio':
        return _buildAspectRatio(description.properties);
      case 'FittedBox':
        return _buildFittedBox(description.properties);
      case 'FractionallySizedBox':
        return _buildFractionallySizedBox(description.properties);
      case 'LimitedBox':
        return _buildLimitedBox(description.properties);
      case 'Offstage':
        return _buildOffstage(description.properties);
      case 'OverflowBox':
        return _buildOverflowBox(description.properties);
      case 'SizedOverflowBox':
        return _buildSizedOverflowBox(description.properties);
      case 'Transform':
        return _buildTransform(description.properties);
      case 'CustomPaint':
        return _buildCustomPaint(description.properties);
      case 'ClipPath':
        return _buildClipPath(description.properties);
      case 'ClipRect':
        return _buildClipRect(description.properties);
      case 'ClipOval':
        return _buildClipOval(description.properties);
      case 'Opacity':
        return _buildOpacity(description.properties);
      case 'BackdropFilter':
        return _buildBackdropFilter(description.properties);
      case 'DecoratedBox':
        return _buildDecoratedBox(description.properties);
      case 'FractionalTranslation':
        return _buildFractionalTranslation(description.properties);
      case 'RotatedBox':
        return _buildRotatedBox(description.properties);
      case 'ConstrainedBox':
        return _buildConstrainedBox(description.properties);
      case 'UnconstrainedBox':
        return _buildUnconstrainedBox(description.properties);
      case 'Scaffold':
        return _buildScaffold(description.properties);
      case 'AppBar':
        return _buildAppBar(description.properties);
      case 'BottomNavigationBar':
        return _buildBottomNavigationBar(description.properties);
      case 'Drawer':
        return _buildDrawer(description.properties);
      case 'TabBar':
        return _buildTabBar(description.properties);
      case 'TabBarView':
        return _buildTabBarView(description.properties);
      case 'AlertDialog':
        return _buildAlertDialog(description.properties);
      case 'SnackBar':
        return _buildSnackBar(description.properties);
      case 'Divider':
        return _buildDivider(description.properties);
      case 'CircularProgressIndicator':
        return _buildCircularProgressIndicator(description.properties);
      case 'LinearProgressIndicator':
        return _buildLinearProgressIndicator(description.properties);
      case 'Slider':
        return _buildSlider(description.properties);
      case 'Switch':
        return _buildSwitch(description.properties);
      case 'Checkbox':
        return _buildCheckbox(description.properties);
      case 'Radio':
        return _buildRadio(description.properties);
      case 'DropdownButton':
        return _buildDropdownButton(description.properties);
      case 'Chip':
        return _buildChip(description.properties);
      case 'Tooltip':
        return _buildTooltip(description.properties);
      case 'AnimatedContainer':
        return _buildAnimatedContainer(description.properties);
      case 'FadeTransition':
        return _buildFadeTransition(description.properties);
      case 'ScaleTransition':
        return _buildScaleTransition(description.properties);
      case 'SlideTransition':
        return _buildSlideTransition(description.properties);
      case 'Opacity':
        return _buildOpacity(description.properties);
      default:
        throw Exception('Unsupported widget type: ${description.type}');
    } 
   } catch (e) {
    print('Error building widget ${description.type}: $e');
    throw e; 
  }
  }

  // static Widget _buildText(Map<String, dynamic> properties) {
  //   TextStyle? style;
  //   if (properties['style'] != null) {
  //     final styleProps = properties['style'] as Map<String, dynamic>;
  //     style = TextStyle(
  //       color: _parseColor(styleProps['color']),
  //       fontSize: double.tryParse(styleProps['fontSize']?.toString() ?? ''),
  //       fontWeight: _parseFontWeight(styleProps['fontWeight']),
  //       fontFamily: styleProps['fontFamily'],
  //     );
  //   } else {
  //     style = TextStyle(
  //       color: _parseColor(properties['color']),
  //       fontSize: double.tryParse(properties['fontSize']?.toString() ?? ''),
  //     );
  //   }
  //   return Text(
  //     properties['text'] ?? '',
  //     style: style,
  //   );
  // }



// static Widget _buildText(Map<String, dynamic> properties) {
//   TextStyle? style;

//   if (properties.containsKey('color') || properties.containsKey('fontSize')) {
//     style = TextStyle(
//       color: _parseColor(properties['color']),
//       fontSize: double.tryParse(properties['fontSize']?.toString() ?? ''),
//       fontWeight: _parseFontWeight(properties['fontWeight']),
//       fontFamily: properties['fontFamily'],
//     );
//   }

//   // Text content might be within a 'text' property or as direct content
//   String text = properties['text'] ?? '';

//   return Text(
//     text,
//     style: style,
//   );
// }



static Widget _buildText(Map<String, dynamic> properties) {
  TextStyle? style;
  if (properties.containsKey('style') || properties.containsKey('color') || properties.containsKey('fontSize')) {
    style = TextStyle(
      color: _parseColor(properties['color'] ?? '#000000'),  // default color
      fontSize: double.tryParse(properties['fontSize']?.toString() ?? '14'), // default font size
      fontWeight: _parseFontWeight(properties['fontWeight']),
      fontFamily: properties['fontFamily'] ?? 'Arial', // default font family
    );
  }
  
  // Safeguard text property to ensure it is never null
  String text = properties['text']?.toString() ?? 'Default Text';
  
  return Text(
    text,
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
      default:
        return null;
    }
  }



static Widget _buildContainer(Map<String, dynamic> properties) {
    return Container(
      color: _parseColor(properties['color']),
      padding: _parsePadding(properties['padding']),
      // Handle child widget for both JSON and XML inputs
      child: properties['child'] != null
          ? build(_getWidgetDescription(properties['child']))
          : null,
    );
  }






  static Widget _buildColumn(Map<String, dynamic> properties) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: _buildChildren(properties['children']),
    );
  }

  static Widget _buildRow(Map<String, dynamic> properties) {
    return Row(
      children: _buildChildren(properties['children']),
    );
  }

  static Widget _buildStack(Map<String, dynamic> properties) {
    return Stack(
      children: _buildChildren(properties['children']),
    );
  }

  static Widget _buildListView(Map<String, dynamic> properties) {
    return ListView(
      children: _buildChildren(properties['children']),
    );
  }

  static Widget _buildGridView(Map<String, dynamic> properties) {
    return GridView.count(
      crossAxisCount:
          int.tryParse(properties['crossAxisCount']?.toString() ?? '2') ?? 2,
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
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
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


static Widget _buildAlign(Map<String, dynamic> properties) {
  return Align(
    alignment: _parseAlignment(properties['alignment']),
    child: properties['child'] != null
        ? build(WidgetDescription.fromJson(properties['child']))
        : null,
  );
}

  static Widget _buildAspectRatio(Map<String, dynamic> properties) {
    return AspectRatio(
      aspectRatio:
          double.tryParse(properties['aspectRatio']?.toString() ?? '1.0') ??
              1.0,
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildFittedBox(Map<String, dynamic> properties) {
    return FittedBox(
      fit: _parseBoxFit(properties['fit']),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildFractionallySizedBox(Map<String, dynamic> properties) {
    return FractionallySizedBox(
      widthFactor: double.tryParse(properties['widthFactor']?.toString() ?? ''),
      heightFactor:
          double.tryParse(properties['heightFactor']?.toString() ?? ''),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

static Widget _buildLimitedBox(Map<String, dynamic> properties) {
  return LimitedBox(
    maxWidth: double.tryParse(properties['maxWidth']?.toString() ?? '0') ?? 0.0,
    maxHeight: double.tryParse(properties['maxHeight']?.toString() ?? '0') ?? 0.0,
    child: properties['children'] != null
        ? Column(children: _buildChildren(properties['children']))
        : null,
  );
}


  static Widget _buildOffstage(Map<String, dynamic> properties) {
    return Offstage(
      offstage: properties['offstage'] ?? true,
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildOverflowBox(Map<String, dynamic> properties) {
    return OverflowBox(
      minWidth: double.tryParse(properties['minWidth']?.toString() ?? '0'),
      maxWidth: double.tryParse(
          properties['maxWidth']?.toString() ?? 'double.infinity'),
      minHeight: double.tryParse(properties['minHeight']?.toString() ?? '0'),
      maxHeight: double.tryParse(
          properties['maxHeight']?.toString() ?? 'double.infinity'),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildSizedOverflowBox(Map<String, dynamic> properties) {
    return SizedOverflowBox(
      size: Size(
        double.tryParse(properties['width']?.toString() ?? '0') ?? 0,
        double.tryParse(properties['height']?.toString() ?? '0') ?? 0,
      ),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildTransform(Map<String, dynamic> properties) {
    Matrix4? transformMatrix = _parseMatrix4(properties['transform']);
    return Transform(
      transform: transformMatrix ?? Matrix4.identity(),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildCustomPaint(Map<String, dynamic> properties) {
    // CustomPaint needs a painter, which may be user-provided
    // For simplicity, we assume no painter is passed and focus on child rendering
    return CustomPaint(
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildClipPath(Map<String, dynamic> properties) {
    // ClipPath would normally need a custom clipper
    // This implementation assumes a null clipper and focuses on child rendering
    return ClipPath(
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildClipRect(Map<String, dynamic> properties) {
    return ClipRect(
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildClipOval(Map<String, dynamic> properties) {
    return ClipOval(
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

static Widget _buildOpacity(Map<String, dynamic> properties) {
  return Opacity(
    opacity: double.tryParse(properties['opacity']?.toString() ?? '1.0') ?? 1.0,
    child: properties['child'] != null
        ? build(WidgetDescription.fromJson(properties['child']))
        : null,
  );
}


  static Widget _buildBackdropFilter(Map<String, dynamic> properties) {
    // BackdropFilter requires a filter
    // This implementation assumes a default filter and focuses on child rendering
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildDecoratedBox(Map<String, dynamic> properties) {
    return DecoratedBox(
      decoration: _parseBoxDecoration(properties['decoration']),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildFractionalTranslation(Map<String, dynamic> properties) {
    return FractionalTranslation(
      translation: Offset(
        double.tryParse(properties['translateX']?.toString() ?? '0') ?? 0,
        double.tryParse(properties['translateY']?.toString() ?? '0') ?? 0,
      ),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildRotatedBox(Map<String, dynamic> properties) {
    return RotatedBox(
      quarterTurns:
          int.tryParse(properties['quarterTurns']?.toString() ?? '0') ?? 0,
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildConstrainedBox(Map<String, dynamic> properties) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth:
            double.tryParse(properties['minWidth']?.toString() ?? '0') ?? 0,
        maxWidth: double.tryParse(
                properties['maxWidth']?.toString() ?? 'double.infinity') ??
            double.infinity,
        minHeight:
            double.tryParse(properties['minHeight']?.toString() ?? '0') ?? 0,
        maxHeight: double.tryParse(
                properties['maxHeight']?.toString() ?? 'double.infinity') ??
            double.infinity,
      ),
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  static Widget _buildUnconstrainedBox(Map<String, dynamic> properties) {
    return UnconstrainedBox(
      child: properties['children'] != null
          ? Column(children: _buildChildren(properties['children']))
          : null,
    );
  }

  // static Widget _buildExpanded(Map<String, dynamic> properties) {
  //   return Expanded(
  //     child: properties['children'] != null
  //         ? Column(children: _buildChildren(properties['children']))
  //         : Container(),
  //   );
  // }

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
    drawer: properties['drawer'] != null
        ? _buildDrawer(properties['drawer'])
        : null,
    bottomNavigationBar: properties['bottomNavigationBar'] != null
        ? _buildBottomNavigationBar(properties['bottomNavigationBar'])
        : null,
  );
}


  // static Widget _buildAppBar(Map<String, dynamic> properties) {
  //   return AppBar(
  //     title: properties['title'] != null
  //         ? build(WidgetDescription.fromJson(properties['title']))
  //         : null,
  //     leading: properties['leading'] != null
  //         ? build(WidgetDescription.fromJson(properties['leading']))
  //         : null,
  //     actions: properties['actions'] != null
  //         ? _buildChildren(properties['actions'])
  //         : null,
  //   );
  // }

  static Widget _buildAppBar(Map<String, dynamic> properties) {
  return AppBar(
    title: properties['title'] != null
        ? build(WidgetDescription.fromJson(properties['title']))
        : null,
    leading: properties['leading'] != null
        ? build(WidgetDescription.fromJson(properties['leading']))
        : null,
    actions: properties['actions'] != null
        ? _buildChildren(properties['actions'])
        : null,
  );
}


static Widget _buildBottomNavigationBar(Map<String, dynamic> properties) {
  return BottomNavigationBar(
    items: properties['items'] != null
        ? _buildBottomNavigationBarItems(properties['items'])
        : [],
  );
}

// static WidgetDescription _parseElement(XmlElement element) {
//     final type = element.name.local;
//     final properties = <String, dynamic>{};
//     print("Parsing element: $type");

//     for (var attribute in element.attributes) {
//         properties[attribute.name.local] = attribute.value;
//         print(" - Attribute: ${attribute.name.local} = ${attribute.value}");
//     }

//     final children = element.children.whereType<XmlElement>().toList();
//     if (children.isNotEmpty) {
//         properties['children'] = children
//             .map((child) => _parseElement(child).toJson())
//             .toList();
//     } else {
//         print("Warning: Element '$type' has no children or is an unexpected node.");
//     }

//     print("Parsed properties: $properties");
//     return WidgetDescription(type: type, properties: properties);
// }


static WidgetDescription _parseElement(XmlElement element) {
    final type = element.name.local;
    final properties = <String, dynamic>{};
    print("Parsing element: $type with attributes ${element.attributes.map((e) => '${e.name.local}: ${e.value}').join(', ')}");

    for (var attribute in element.attributes) {
        properties[attribute.name.local] = attribute.value;
    }

    final children = element.children.whereType<XmlElement>().toList();
    if (children.isNotEmpty) {
        properties['children'] = children
            .map((child) => _parseElement(child).toJson())
            .toList();
    } else {
        print("Warning: Element '$type' has no children.");
    }

    print("Parsed properties for element '$type': $properties");
    return WidgetDescription(type: type, properties: properties);
}



static List<BottomNavigationBarItem> _buildBottomNavigationBarItems(List<dynamic> items) {
  return items.map((item) {
    final itemProps = item as Map<String, dynamic>;
    return BottomNavigationBarItem(
      icon: build(WidgetDescription.fromJson(itemProps['icon'])),
      label: itemProps['label'],
    );
  }).toList();
}


  static Widget _buildDrawer(Map<String, dynamic> properties) {
    return Drawer(
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildTabBar(Map<String, dynamic> properties) {
    return TabBar(
      tabs:
          properties['tabs'] != null ? _buildChildren(properties['tabs']) : [],
    );
  }

  static Widget _buildTabBarView(Map<String, dynamic> properties) {
    return TabBarView(
      children: properties['children'] != null
          ? _buildChildren(properties['children'])
          : [],
    );
  }

  static Widget _buildAlertDialog(Map<String, dynamic> properties) {
    return AlertDialog(
      title: properties['title'] != null
          ? build(WidgetDescription.fromJson(properties['title']))
          : null,
      content: properties['content'] != null
          ? build(WidgetDescription.fromJson(properties['content']))
          : null,
      actions: properties['actions'] != null
          ? _buildChildren(properties['actions'])
          : null,
    );
  }

  static Widget _buildSnackBar(Map<String, dynamic> properties) {
    return SnackBar(
      content: properties['content'] != null
          ? build(WidgetDescription.fromJson(properties['content']))
          : Container(),
    );
  }

  static Widget _buildDivider(Map<String, dynamic> properties) {
    return Divider();
  }

  static Widget _buildCircularProgressIndicator(
      Map<String, dynamic> properties) {
    return CircularProgressIndicator();
  }

  static Widget _buildLinearProgressIndicator(Map<String, dynamic> properties) {
    return LinearProgressIndicator();
  }

  static Widget _buildSlider(Map<String, dynamic> properties) {
    return Slider(
      value: double.tryParse(properties['value']?.toString() ?? '0') ?? 0,
      onChanged: (value) {},
    );
  }

  static Widget _buildSwitch(Map<String, dynamic> properties) {
    return Switch(
      value: properties['value'] ?? false,
      onChanged: (value) {},
    );
  }

  static Widget _buildCheckbox(Map<String, dynamic> properties) {
    return Checkbox(
      value: properties['value'] ?? false,
      onChanged: (value) {},
    );
  }

  static Widget _buildRadio(Map<String, dynamic> properties) {
    return Radio(
      value: properties['value'] ?? false,
      groupValue: properties['groupValue'],
      onChanged: (value) {},
    );
  }

  static Widget _buildDropdownButton(Map<String, dynamic> properties) {
    return DropdownButton(
      items: properties['items'] != null
          ? _buildDropdownButtonItems(properties['items'])
          : [],
      onChanged: (value) {},
    );
  }

  static List<DropdownMenuItem> _buildDropdownButtonItems(List<dynamic> items) {
    return items.map((item) {
      final itemProps = item as Map<String, dynamic>;
      return DropdownMenuItem(
        value: itemProps['value'],
        child: build(WidgetDescription.fromJson(itemProps['child'])),
      );
    }).toList();
  }

  static Widget _buildChip(Map<String, dynamic> properties) {
    return Chip(
      label: properties['label'] != null
          ? build(WidgetDescription.fromJson(properties['label']))
          : Container(),
    );
  }

  static Widget _buildTooltip(Map<String, dynamic> properties) {
    return Tooltip(
      message: properties['message'],
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildAnimatedContainer(Map<String, dynamic> properties) {
    return AnimatedContainer(
      duration: Duration(milliseconds: properties['duration'] ?? 300),
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildFadeTransition(Map<String, dynamic> properties) {
    return FadeTransition(
      opacity: AlwaysStoppedAnimation(
        double.tryParse(properties['opacity']?.toString() ?? '1.0') ?? 1.0,
      ),
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildScaleTransition(Map<String, dynamic> properties) {
    return ScaleTransition(
      scale: AlwaysStoppedAnimation(
        double.tryParse(properties['scale']?.toString() ?? '1.0') ?? 1.0,
      ),
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  static Widget _buildSlideTransition(Map<String, dynamic> properties) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: Offset(
          double.tryParse(properties['offsetX']?.toString() ?? '0') ?? 0,
          double.tryParse(properties['offsetY']?.toString() ?? '0') ?? 0,
        ),
      ).animate(CurvedAnimation(
        parent: AlwaysStoppedAnimation(1.0),
        curve: Curves.easeInOut,
      )),
      child: properties['child'] != null
          ? build(WidgetDescription.fromJson(properties['child']))
          : null,
    );
  }

  // static List<Widget> _buildChildren(dynamic children) {
  //   if (children is List) {
  //     return children.map((child) => build(_getWidgetDescription(child))).toList();
  //   } else {
  //     return [];
  //   }
  // }

static List<Widget> _buildChildren(List<dynamic>? children) {
  return children?.map((child) {
    if (child is Map<String, dynamic>) {
      if (child.containsKey('type') && child.containsKey('properties')) {
        return build(WidgetDescription.fromJson(child));
      }
    }
    return SizedBox.shrink(); // Default widget if nothing is parsed
  }).toList() ?? [];
}




static Color? _parseColor(String colorString) {
    if (colorString.startsWith('#')) {
        colorString = colorString.substring(1);
    }
    if (colorString.length == 6) {
        return Color(int.parse('0xFF$colorString'));
    }
    return null;  
}


static EdgeInsets? _parsePadding(String? paddingString) {
  if (paddingString == null) return null;
  final parts = paddingString.split(',').map(double.parse).toList();
  if (parts.length == 4) {
    return EdgeInsets.fromLTRB(parts[0], parts[1], parts[2], parts[3]);
  }
  return EdgeInsets.zero;
}


  static Alignment _parseAlignment(String? alignmentString) {
    switch (alignmentString) {
      case 'topLeft':
        return Alignment.topLeft;
      case 'topCenter':
        return Alignment.topCenter;
      case 'topRight':
        return Alignment.topRight;
      case 'centerLeft':
        return Alignment.centerLeft;
      case 'center':
        return Alignment.center;
      case 'centerRight':
        return Alignment.centerRight;
      case 'bottomLeft':
        return Alignment.bottomLeft;
      case 'bottomCenter':
        return Alignment.bottomCenter;
      case 'bottomRight':
        return Alignment.bottomRight;
      default:
        return Alignment.center;
    }
  }

  static BoxFit _parseBoxFit(String? fitString) {
    switch (fitString) {
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'cover':
        return BoxFit.cover;
      case 'fitWidth':
        return BoxFit.fitWidth;
      case 'fitHeight':
        return BoxFit.fitHeight;
      case 'none':
        return BoxFit.none;
      case 'scaleDown':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  static Matrix4? _parseMatrix4(String? matrixString) {
    if (matrixString == null) return null;
    final values = matrixString.split(',').map(double.parse).toList();
    if (values.length == 16) {
      return Matrix4.fromList(values);
    }
    return null;
  }

  static BoxDecoration _parseBoxDecoration(
      Map<String, dynamic>? decorationProps) {
    if (decorationProps == null) return BoxDecoration();
    return BoxDecoration(
      color: _parseColor(decorationProps['color']),
      borderRadius: decorationProps['borderRadius'] != null
          ? BorderRadius.circular(double.tryParse(
                  decorationProps['borderRadius']?.toString() ?? '0') ??
              0)
          : null,
      boxShadow: decorationProps['boxShadow'] != null
          ? [_parseBoxShadow(decorationProps['boxShadow'])]
          : null,
      // Add more decoration properties if needed
    );
  }

  static BoxShadow _parseBoxShadow(Map<String, dynamic> shadowProps) {
    return BoxShadow(
      color: _parseColor(shadowProps['color']) ?? Colors.black,
      offset: Offset(
        double.tryParse(shadowProps['offsetX']?.toString() ?? '0') ?? 0,
        double.tryParse(shadowProps['offsetY']?.toString() ?? '0') ?? 0,
      ),
      blurRadius:
          double.tryParse(shadowProps['blurRadius']?.toString() ?? '0') ?? 0,
    );
  }
  
    static WidgetDescription _getWidgetDescription(dynamic child) {
    if (child is XmlElement) {
      return WidgetDescription.fromXml(child);
    } else if (child is Map<String, dynamic>) {
      return WidgetDescription.fromJson(child);
    } else {
      throw Exception('Unsupported child format');
    }
  }
}