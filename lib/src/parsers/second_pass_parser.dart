// import 'package:flutter/material.dart';
// import '../models/widget_description.dart';

// class SecondPassParser {
//   static Widget buildWidget(WidgetDescription description) {
//     print('SecondPassParser: Building widget for type: ${description.type}');
//     switch (description.type) {
//       case 'Root':
//         return description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink();
//       case 'Container':
//         return Container(
//           key: description.properties['key'] != null ? Key(description.properties['key']) : null,
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//           color: description.properties['color'] != null
//               ? Color(int.parse(description.properties['color'], radix: 16) + 0xFF000000)
//               : null,
//           padding: _parseEdgeInsets(description.properties['padding']),
//           margin: _parseEdgeInsets(description.properties['margin']),
//         );
//       case 'Text':
//         return Text(
//           description.properties['text'] ?? '',
//           style: TextStyle(
//             color: description.properties['color'] != null
//                 ? Color(int.parse(description.properties['color'], radix: 16) + 0xFF000000)
//                 : null,
//             fontSize: description.properties['fontSize'] != null
//                 ? double.parse(description.properties['fontSize'])
//                 : null,
//           ),
//         );
//       case 'Column':
//         return Column(
//           mainAxisAlignment: _parseMainAxisAlignment(description.properties['mainAxisAlignment']),
//           crossAxisAlignment: _parseCrossAxisAlignment(description.properties['crossAxisAlignment']),
//           children: description.children.map(buildWidget).toList(),
//         );
//       case 'Row':
//         return Row(
//           mainAxisAlignment: _parseMainAxisAlignment(description.properties['mainAxisAlignment']),
//           crossAxisAlignment: _parseCrossAxisAlignment(description.properties['crossAxisAlignment']),
//           children: description.children.map(buildWidget).toList(),
//         );
//       case 'Center':
//         return Center(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Padding':
//         return Padding(
//           padding: _parseEdgeInsets(description.properties['padding']),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Expanded':
//         return Expanded(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'ListView':
//         return ListView(
//           shrinkWrap: true,
//           children: description.children.map(buildWidget).toList(),
//         );
//       case 'Image':
//         return Image.network(
//           description.properties['url'] ?? '',
//           width: description.properties['width'] != null ? double.parse(description.properties['width']) : null,
//           height: description.properties['height'] != null ? double.parse(description.properties['height']) : null,
//           fit: _parseBoxFit(description.properties['fit']),
//         );
//       case 'Icon':
//         return Icon(
//           IconData(int.parse(description.properties['code'] ?? '0'), fontFamily: 'MaterialIcons'),
//           color: description.properties['color'] != null
//               ? Color(int.parse(description.properties['color'], radix: 16) + 0xFF000000)
//               : null,
//           size: description.properties['size'] != null ? double.parse(description.properties['size']) : null,
//         );
//       case 'ElevatedButton':
//         return ElevatedButton(
//           onPressed: () {},
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'TextButton':
//         return TextButton(
//           onPressed: () {},
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Scaffold':
//         return Scaffold(
//           appBar: description.properties['appBar'] != null
//               ? buildWidget(description.children.first) as PreferredSizeWidget?
//               : null,
//           body: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'AppBar':
//         return AppBar(
//           title: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'FloatingActionButton':
//         return FloatingActionButton(
//           onPressed: () {},
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Card':
//         return Card(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'ListTile':
//         return ListTile(
//           title: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//           subtitle: description.children.length > 1 ? buildWidget(description.children[1]) : null,
//         );
//       case 'SizedBox':
//         return SizedBox(
//           width: description.properties['width'] != null ? double.parse(description.properties['width']) : null,
//           height: description.properties['height'] != null ? double.parse(description.properties['height']) : null,
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'TextField':
//         return TextField(
//           decoration: InputDecoration(
//             hintText: description.properties['hintText'],
//           ),
//         );
//       case 'IconButton':
//         return IconButton(
//           icon: Icon(
//             IconData(int.parse(description.properties['code'] ?? '0'), fontFamily: 'MaterialIcons'),
//             color: description.properties['color'] != null
//                 ? Color(int.parse(description.properties['color'], radix: 16) + 0xFF000000)
//                 : null,
//             size: description.properties['size'] != null ? double.parse(description.properties['size']) : null,
//           ),
//           onPressed: () {},
//         );
//       case 'Drawer':
//         return Drawer(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'BottomNavigationBar':
//         return BottomNavigationBar(
//           items: description.children.map((child) {
//             final childDescription = child as WidgetDescription;
//             return BottomNavigationBarItem(
//               icon: buildWidget(childDescription.children.first),
//               label: childDescription.properties['label'],
//             );
//           }).toList(),
//         );
//       case 'TabBar':
//         return TabBar(
//           tabs: description.children.map((child) {
//             return buildWidget(child);
//           }).toList(),
//         );
//       case 'TabBarView':
//         return TabBarView(
//           children: description.children.map((child) {
//             return buildWidget(child);
//           }).toList(),
//         );
//       case 'AlertDialog':
//         return AlertDialog(
//           title: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//           content: description.children.length > 1 ? buildWidget(description.children[1]) : SizedBox.shrink(),
//         );
//       case 'SnackBar':
//         return SnackBar(
//           content: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Divider':
//         return Divider();
//       case 'CircularProgressIndicator':
//         return CircularProgressIndicator();
//       case 'LinearProgressIndicator':
//         return LinearProgressIndicator();
//       case 'Slider':
//         return Slider(
//           value: description.properties['value'] != null ? double.parse(description.properties['value']) : 0.0,
//           onChanged: (value) {},
//         );
//       case 'Switch':
//         return Switch(
//           value: description.properties['value'] != null ? description.properties['value'] == 'true' : false,
//           onChanged: (value) {},
//         );
//       case 'Checkbox':
//         return Checkbox(
//           value: description.properties['value'] != null ? description.properties['value'] == 'true' : false,
//           onChanged: (value) {},
//         );
//       case 'Radio':
//         return Radio(
//           value: description.properties['value'] != null ? description.properties['value'] == 'true' : false,
//           groupValue: description.properties['groupValue'],
//           onChanged: (value) {},
//         );
//       case 'DropdownButton':
//         return DropdownButton(
//           items: description.children.map((child) {
//             final childDescription = child as WidgetDescription;
//             return DropdownMenuItem(
//               value: childDescription.properties['value'],
//               child: buildWidget(childDescription),
//             );
//           }).toList(),
//           onChanged: (value) {},
//         );
//       case 'Chip':
//         return Chip(
//           label: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Tooltip':
//         return Tooltip(
//           message: description.properties['message'],
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'AnimatedContainer':
//         return AnimatedContainer(
//           duration: Duration(milliseconds: description.properties['duration'] != null ? int.parse(description.properties['duration']) : 300),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'FadeTransition':
//         return FadeTransition(
//           opacity: AlwaysStoppedAnimation(
//             description.properties['opacity'] != null ? double.parse(description.properties['opacity']) : 1.0,
//           ),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//             case 'ScaleTransition':
//         return ScaleTransition(
//           scale: AlwaysStoppedAnimation(
//             description.properties['scale'] != null ? double.parse(description.properties['scale']) : 1.0,
//           ),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'SlideTransition':
//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: Offset.zero,
//             end: Offset(
//               description.properties['offsetX'] != null ? double.parse(description.properties['offsetX']) : 0.0,
//               description.properties['offsetY'] != null ? double.parse(description.properties['offsetY']) : 0.0,
//             ),
//           ).animate(CurvedAnimation(
//             parent: AlwaysStoppedAnimation(1.0),
//             curve: Curves.easeInOut,
//           )),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Opacity':
//         return Opacity(
//           opacity: description.properties['opacity'] != null ? double.parse(description.properties['opacity']) : 1.0,
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       default:
//         throw UnimplementedError('Widget type ${description.type} not implemented');
//     }
//   }

//   // Utility methods for parsing common properties like padding, alignment, etc.
//   static EdgeInsets _parseEdgeInsets(String? paddingString) {
//     if (paddingString == null) return EdgeInsets.zero;
//     final values = paddingString.split(',').map((e) => double.tryParse(e) ?? 0).toList();
//     if (values.length == 4) {
//       return EdgeInsets.fromLTRB(values[0], values[1], values[2], values[3]);
//     }
//     return EdgeInsets.zero;
//   }

//   static MainAxisAlignment _parseMainAxisAlignment(String? alignment) {
//     switch (alignment) {
//       case 'start':
//         return MainAxisAlignment.start;
//       case 'end':
//         return MainAxisAlignment.end;
//       case 'center':
//         return MainAxisAlignment.center;
//       case 'spaceBetween':
//         return MainAxisAlignment.spaceBetween;
//       case 'spaceAround':
//         return MainAxisAlignment.spaceAround;
//       case 'spaceEvenly':
//         return MainAxisAlignment.spaceEvenly;
//       default:
//         return MainAxisAlignment.start;
//     }
//   }

//   static CrossAxisAlignment _parseCrossAxisAlignment(String? alignment) {
//     switch (alignment) {
//       case 'start':
//         return CrossAxisAlignment.start;
//       case 'end':
//         return CrossAxisAlignment.end;
//       case 'center':
//         return CrossAxisAlignment.center;
//       case 'stretch':
//         return CrossAxisAlignment.stretch;
//       case 'baseline':
//         return CrossAxisAlignment.baseline;
//       default:
//         return CrossAxisAlignment.center;
//     }
//   }

//   static BoxFit _parseBoxFit(String? fit) {
//     switch (fit) {
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
//       case 'none':
//         return BoxFit.none;
//       case 'scaleDown':
//         return BoxFit.scaleDown;
//       default:
//         return BoxFit.contain;
//     }
//   }
// }
 






































// import 'package:flutter/material.dart';
// import '../models/widget_description.dart';

// class SecondPassParser {
//   static Widget buildWidget(WidgetDescription description) {
//     print('SecondPassParser: Building widget for type: ${description.type}');
//     switch (description.type) {
//       case 'Root':
//         return description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink();
//       case 'Container':
//         return Container(
//           key: description.properties['key'] != null ? Key(description.properties['key']) : null,
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//           color: description.properties['color'] != null
//               ? Color(int.parse(description.properties['color'], radix: 16))
//               : null,
//           padding: description.properties['padding'] != null
//               ? EdgeInsets.fromLTRB(
//                   double.parse(description.properties['padding'].split(',')[0]),
//                   double.parse(description.properties['padding'].split(',')[1]),
//                   double.parse(description.properties['padding'].split(',')[2]),
//                   double.parse(description.properties['padding'].split(',')[3]),
//                 )
//               : null,
//           // Add other properties as needed
//         );
//       case 'Text':
//         return Text(
//           description.properties['text'] ?? '',
//           style: TextStyle(
//             color: description.properties['color'] != null
//                 ? Color(int.parse(description.properties['color'], radix: 16))
//                 : null,
//             fontSize: description.properties['fontSize'] != null
//                 ? double.parse(description.properties['fontSize'])
//                 : null,
//           ),
//         );
//       case 'Column':
//         return Column(
//           children: description.children.map(buildWidget).toList(),
//         );
//       case 'Row':
//         return Row(
//           children: description.children.map(buildWidget).toList(),
//         );
//       case 'Center':
//         return Center(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Padding':
//         return Padding(
//           padding: description.properties['padding'] != null
//               ? EdgeInsets.fromLTRB(
//                   double.parse(description.properties['padding'].split(',')[0]),
//                   double.parse(description.properties['padding'].split(',')[1]),
//                   double.parse(description.properties['padding'].split(',')[2]),
//                   double.parse(description.properties['padding'].split(',')[3]),
//                 )
//               : EdgeInsets.zero,
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Expanded':
//         return Expanded(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'ListView':
//         return ListView(
//           children: description.children.map(buildWidget).toList(),
//         );
//       case 'Image':
//         return Image.network(
//           description.properties['url'] ?? '',
//         );
//       case 'Icon':
//         return Icon(
//           IconData(int.parse(description.properties['code'] ?? '0'), fontFamily: 'MaterialIcons'),
//           color: description.properties['color'] != null
//               ? Color(int.parse(description.properties['color'], radix: 16))
//               : null,
//           size: description.properties['size'] != null
//               ? double.parse(description.properties['size'])
//               : null,
//         );
//       case 'ElevatedButton':
//         return ElevatedButton(
//           onPressed: () {},
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'TextButton':
//         return TextButton(
//           onPressed: () {},
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Scaffold':
//         return Scaffold(
//           appBar: description.properties['appBar'] != null
//               ? AppBar(
//                   title: Text(description.properties['appBar']),
//                 )
//               : null,
//           body: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'AppBar':
//         return AppBar(
//           title: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'FloatingActionButton':
//         return FloatingActionButton(
//           onPressed: () {},
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Card':
//         return Card(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'ListTile':
//         return ListTile(
//           title: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//           subtitle: description.children.length > 1 ? buildWidget(description.children[1]) : null,
//         );
//       case 'SizedBox':
//         return SizedBox(
//           width: description.properties['width'] != null ? double.parse(description.properties['width']) : null,
//           height: description.properties['height'] != null ? double.parse(description.properties['height']) : null,
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'TextField':
//         return TextField(
//           decoration: InputDecoration(
//             hintText: description.properties['hintText'],
//           ),
//         );
//       case 'IconButton':
//         return IconButton(
//           icon: Icon(
//             IconData(int.parse(description.properties['code'] ?? '0'), fontFamily: 'MaterialIcons'),
//             color: description.properties['color'] != null
//                 ? Color(int.parse(description.properties['color'], radix: 16))
//                 : null,
//             size: description.properties['size'] != null
//                 ? double.parse(description.properties['size'])
//                 : null,
//           ),
//           onPressed: () {},
//         );
//       case 'Drawer':
//         return Drawer(
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'BottomNavigationBar':
//         return BottomNavigationBar(
//           items: description.children.map((child) {
//             final childDescription = child as WidgetDescription;
//             return BottomNavigationBarItem(
//               icon: buildWidget(childDescription.children.first),
//               label: childDescription.properties['label'],
//             );
//           }).toList(),
//         );
//       case 'TabBar':
//         return TabBar(
//           tabs: description.children.map((child) {
//             return buildWidget(child);
//           }).toList(),
//         );
//       case 'TabBarView':
//         return TabBarView(
//           children: description.children.map((child) {
//             return buildWidget(child);
//           }).toList(),
//         );
//       case 'AlertDialog':
//         return AlertDialog(
//           title: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//           content: description.children.length > 1 ? buildWidget(description.children[1]) : SizedBox.shrink(),
//         );
//       case 'SnackBar':
//         return SnackBar(
//           content: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Divider':
//         return Divider();
//       case 'CircularProgressIndicator':
//         return CircularProgressIndicator();
//       case 'LinearProgressIndicator':
//         return LinearProgressIndicator();
//       case 'Slider':
//         return Slider(
//           value: description.properties['value'] != null ? double.parse(description.properties['value']) : 0.0,
//           onChanged: (value) {},
//         );
//       case 'Switch':
//         return Switch(
//           value: description.properties['value'] != null ? description.properties['value'] == 'true' : false,
//           onChanged: (value) {},
//         );
//       case 'Checkbox':
//         return Checkbox(
//           value: description.properties['value'] != null ? description.properties['value'] == 'true' : false,
//           onChanged: (value) {},
//         );
//       case 'Radio':
//         return Radio(
//           value: description.properties['value'] != null ? description.properties['value'] == 'true' : false,
//           groupValue: description.properties['groupValue'],
//           onChanged: (value) {},
//         );
//       case 'DropdownButton':
//         return DropdownButton(
//           items: description.children.map((child) {
//             final childDescription = child as WidgetDescription;
//             return DropdownMenuItem(
//               value: childDescription.properties['value'],
//               child: buildWidget(childDescription),
//             );
//           }).toList(),
//           onChanged: (value) {},
//         );
//       case 'Chip':
//         return Chip(
//           label: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'Tooltip':
//         return Tooltip(
//           message: description.properties['message'],
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'AnimatedContainer':
//         return AnimatedContainer(
//           duration: Duration(milliseconds: description.properties['duration'] != null ? int.parse(description.properties['duration']) : 300),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'FadeTransition':
//         return FadeTransition(
//           opacity: description.properties['opacity'] != null ? AlwaysStoppedAnimation(double.parse(description.properties['opacity'])) : AlwaysStoppedAnimation(1.0),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'ScaleTransition':
//         return ScaleTransition(
//           scale: description.properties['scale'] != null ? AlwaysStoppedAnimation(double.parse(description.properties['scale'])) : AlwaysStoppedAnimation(1.0),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       case 'SlideTransition':
//         return SlideTransition(
//           position: description.properties['offset'] != null
//               ? Tween<Offset>(
//                   begin: Offset.zero,
//                   end: Offset(double.parse(description.properties['offset'].split(',')[0]), double.parse(description.properties['offset'].split(',')[1])),
//                 ).animate(CurvedAnimation(parent: AlwaysStoppedAnimation(1.0), curve: Curves.easeInOut))
//               : Tween<Offset>(
//                   begin: Offset.zero,
//                   end: Offset.zero,
//                 ).animate(CurvedAnimation(parent: AlwaysStoppedAnimation(1.0), curve: Curves.easeInOut)),
//           child: description.children.isNotEmpty ? buildWidget(description.children.first) : SizedBox.shrink(),
//         );
//       // Add more widget types here
//       default:
//         throw UnimplementedError('Widget type ${description.type} not implemented');
//     }
//   }
// }




























































