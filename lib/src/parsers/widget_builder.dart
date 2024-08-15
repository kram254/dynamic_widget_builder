import 'package:dynamic_widget_builder/src/models/widget_description.dart';
import 'package:dynamic_widget_builder/src/parsers/first_pass_parser.dart';
import 'package:dynamic_widget_builder/src/parsers/second_pass_parser.dart';
import 'package:flutter/material.dart' as flutter; // Use a prefix for Flutter imports

class WidgetBuilderJson {
  static flutter.Widget buildWidget(WidgetDescription description) {
    switch (description.type) {
      case 'Container':
        return _buildContainer(description);
      case 'Column':
        return _buildColumn(description);
      case 'Row':
        return _buildRow(description);
      case 'Card':
        return _buildCard(description);
      case 'Text':
        return _buildText(description);
      case 'Image':
        return _buildImage(description);
      case 'ListView':
        return _buildListView(description);
      case 'Stack':
        return _buildStack(description);
      case 'Expanded':
        return _buildExpanded(description);
      case 'Padding':
        return _buildPadding(description);
      case 'Center':
        return _buildCenter(description);
      case 'Align':
        return _buildAlign(description);
      case 'SizedBox':
        return _buildSizedBox(description);
      case 'Scaffold':
        return _buildScaffold(description);
      case 'AppBar':
        return _buildAppBar(description);
      case 'TextField':
        return _buildTextField(description);
      case 'ElevatedButton':
        return _buildElevatedButton(description);
      case 'Icon':
        return _buildIcon(description);
      case 'IconButton':
        return _buildIconButton(description);
      case 'FloatingActionButton':
        return _buildFloatingActionButton(description);
      // Add more cases for other widget types
      default:
        return flutter.Container(); // Default widget if type is not recognized
    }
  }

  static flutter.Widget _buildContainer(WidgetDescription description) {
    return flutter.Container(
      height: SecondPassParser.parseSize(description.properties['height']),
      width: SecondPassParser.parseSize(description.properties['width']),
      color: SecondPassParser.parseColor(description.properties['color']),
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }

  static flutter.Widget _buildColumn(WidgetDescription description) {
    List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
    return flutter.Column(
      children: children,
    );
  }

  static flutter.Widget _buildRow(WidgetDescription description) {
    List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
    return flutter.Row(
      children: children,
    );
  }

  static flutter.Widget _buildCard(WidgetDescription description) {
    return flutter.Card(
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }

  static flutter.Widget _buildText(WidgetDescription description) {
    return flutter.Text(
      description.properties['data'],
      style: flutter.TextStyle(fontSize: SecondPassParser.parseFontSize(description.properties['fontSize'])),
    );
  }

  static flutter.Widget _buildImage(WidgetDescription description) {
    return flutter.Image.network(
      description.properties['url'],
    );
  }

  static flutter.Widget _buildListView(WidgetDescription description) {
    List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
    return flutter.ListView(
      children: children,
    );
  }

  static flutter.Widget _buildStack(WidgetDescription description) {
    List<flutter.Widget> children = FirstPassParser.parseChildren(description.properties['children']);
    return flutter.Stack(
      children: children,
    );
  }

  static flutter.Widget _buildExpanded(WidgetDescription description) {
    return flutter.Expanded(
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : flutter.Container(), // Provide a default Widget if 'child' is null
    );
  }

  // static flutter.Widget _buildExpanded(WidgetDescription description) {
  //   return flutter.Expanded(
  //     child: description.properties['child'] != null
  //         ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
  //         : null,
  //   );
  // }

  static flutter.Widget _buildPadding(WidgetDescription description) {
    return flutter.Padding(
      padding: flutter.EdgeInsets.all(SecondPassParser.parseSize(description.properties['padding'])),
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }

  static flutter.Widget _buildCenter(WidgetDescription description) {
    return flutter.Center(
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }

  static flutter.Widget _buildAlign(WidgetDescription description) {
    return flutter.Align(
      alignment: _parseAlignment(description.properties['alignment']),
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }

  static flutter.Alignment _parseAlignment(String alignment) {
    switch (alignment) {
      case 'topLeft':
        return flutter.Alignment.topLeft;
      case 'topCenter':
        return flutter.Alignment.topCenter;
      case 'topRight':
        return flutter.Alignment.topRight;
      case 'centerLeft':
        return flutter.Alignment.centerLeft;
      case 'center':
        return flutter.Alignment.center;
      case 'centerRight':
        return flutter.Alignment.centerRight;
      case 'bottomLeft':
        return flutter.Alignment.bottomLeft;
      case 'bottomCenter':
        return flutter.Alignment.bottomCenter;
      case 'bottomRight':
        return flutter.Alignment.bottomRight;
      default:
        return flutter.Alignment.center;
    }
  }

  static flutter.Widget _buildSizedBox(WidgetDescription description) {
    return flutter.SizedBox(
      height: SecondPassParser.parseSize(description.properties['height']),
      width: SecondPassParser.parseSize(description.properties['width']),
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }


  static flutter.Widget _buildScaffold(WidgetDescription description) {
    return flutter.Scaffold(
      appBar: description.properties['appBar'] != null
          ? _buildAppBar(WidgetDescription.fromJson(description.properties['appBar'])) as flutter.PreferredSizeWidget?
          : null,
      body: description.properties['body'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['body']))
          : null,
      floatingActionButton: description.properties['floatingActionButton'] != null
          ? _buildFloatingActionButton(WidgetDescription.fromJson(description.properties['floatingActionButton']))
          : null,
    );
  }

  static flutter.Widget _buildAppBar(WidgetDescription description) {
    return flutter.AppBar(
      title: description.properties['title'] != null
          ? _buildText(WidgetDescription.fromJson(description.properties['title']))
          : null,
    );
  }

  static flutter.Widget _buildTextField(WidgetDescription description) {
    return flutter.TextField();
  }

  static flutter.Widget _buildElevatedButton(WidgetDescription description) {
    return flutter.ElevatedButton(
      onPressed: () {},
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }

    static flutter.Widget _buildIcon(WidgetDescription description) {
    return flutter.Icon(
      _parseIcon(description.properties['icon']),
      size: SecondPassParser.parseSize(description.properties['size']),
      color: SecondPassParser.parseColor(description.properties['color']),
    );
  }

  static flutter.IconData _parseIcon(String iconName) {
    switch (iconName) {
      case 'add':
        return flutter.Icons.add;
      case 'home':
        return flutter.Icons.home;
      case 'settings':
        return flutter.Icons.settings;
        
      default:
        return flutter.Icons.error; 
    }
  }

  static flutter.Widget _buildIconButton(WidgetDescription description) {
    return flutter.IconButton(
      icon: _buildIcon(WidgetDescription.fromJson({
        'type': 'Icon',
        'properties': description.properties['icon'],
      })),
      onPressed: () {},
    );
  }

  static flutter.Widget _buildFloatingActionButton(WidgetDescription description) {
    return flutter.FloatingActionButton(
      onPressed: () {},
      child: description.properties['child'] != null
          ? buildWidget(WidgetDescription.fromJson(description.properties['child']))
          : null,
    );
  }
  
}



