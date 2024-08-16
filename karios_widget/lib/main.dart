import 'package:flutter/material.dart' as flutter;
import 'package:dynamic_widget_builder/dynamic_widget_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  flutter.runApp(MyApp());
}

class MyApp extends flutter.StatelessWidget {
  @override
  flutter.Widget build(flutter.BuildContext context) {
    return ScreenUtilInit(
      designSize: const flutter.Size(360, 690),
      builder: (context, child) => flutter.MaterialApp(
        home: flutter.Scaffold(
          appBar: flutter.AppBar(
            title: const flutter.Text('Dynamic Widget Builder Test'),
          ),
          body: flutter.SingleChildScrollView(
            child: flutter.Column(
              children: [
                flutter.Text('XML Input', style: flutter.TextStyle(fontSize: 20.sp)),
                flutter.SizedBox(height: 20.h),
                DynamicWidgetBuilder.parse('''
<Column>
  <children>
    <Text>Hello from XML!</Text>
    <Container>
      <color>#00FF00</color>
      <child>
        <Text>Inside Container</Text>
      </child>
    </Container>
  </children>
</Column>
                '''),
                flutter.Divider(),
                flutter.Text('JSON Input', style: flutter.TextStyle(fontSize: 20.sp)),
                flutter.SizedBox(height: 20.h),
                DynamicWidgetBuilder.parse('''
{
  "type": "Column",
  "properties": {
    "children": [
      {
        "type": "Text",
        "properties": {
          "data": "Hello from JSON!"
        }
      },
      {
        "type": "Container",
        "properties": {
          "color": "00FF00",
          "child": {
            "type": "Text",
            "properties": {
              "data": "Inside Container"
            }
          }
        }
      }
    ]
  }
}
                '''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


















// import 'package:flutter/material.dart' as flutter;
// import 'package:dynamic_widget_builder/dynamic_widget_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() {
//   flutter.runApp(MyApp());
// }

// class MyApp extends flutter.StatelessWidget {
//   @override
//   flutter.Widget build(flutter.BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const flutter.Size(360, 690),
//       builder: (context, child) => flutter.MaterialApp(
//         home: flutter.Scaffold(
//           appBar: flutter.AppBar(
//             title: const flutter.Text('Dynamic Widget Builder Test'),
//           ),
//           body: flutter.SingleChildScrollView( 
//             child: flutter.Column(
//               children: [
//                 flutter.Text('XML Input', style: flutter.TextStyle(fontSize: 20.sp)),
//                 flutter.SizedBox(height: 20.h),
//                 DynamicWidgetBuilder.parse('<Text>Hello World</Text>'), 
//                 flutter.Divider(),
//                 flutter.Text('JSON Input', style: flutter.TextStyle(fontSize: 20.sp)),
//                 flutter.SizedBox(height: 20.h),
//                 DynamicWidgetBuilder.parse('{"type": "Text", "properties": {"data": "Hello World"}}'), 
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }























// import 'package:flutter/material.dart' as flutter;
// import 'package:dynamic_widget_builder/dynamic_widget_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() {
//   flutter.runApp(MyApp());
// }

// class MyApp extends flutter.StatelessWidget {
//   @override
//   flutter.Widget build(flutter.BuildContext context) {
//     return ScreenUtilInit(
//       // Wrap MaterialApp with ScreenUtilInit
//       designSize: const flutter.Size(360, 690), // Set your design size
//       builder: (context, child) => flutter.MaterialApp(
//         home: flutter.Scaffold(
//           appBar: flutter.AppBar(
//               title: const flutter.Text('Dynamic Widget Builder Test')),
//           body: flutter.Center(
//             child: DynamicWidgetBuilder.parse('''
//               {
//   "type": "Scaffold",
//   "properties": {
//     "appBar": {
//       "type": "AppBar",
//       "properties": {
//         "title": {
//           "type": "Text",
//           "properties": {
//             "data": "Dynamic Widget Builder",
//             "fontSize": "20.sp"
//           }
//         }
//       }
//     },
//     "body": {
//       "type": "Center",
//       "properties": {
//         "child": {
//           "type": "Column",
//           "properties": {
//             "children": [
//               {
//                 "type": "Text",
//                 "properties": {
//                   "data": "Hello, World!",
//                   "fontSize": "16.sp"
//                 }
//               },
//               {
//                 "type": "Text",
//                 "properties": {
//                   "data": "Welcome to Dynamic Widget Builder",
//                   "fontSize": "14.sp"
//                 }
//               }
//             ]
//           }
//         }
//       }
//     },
//     "floatingActionButton": {
//       "type": "FloatingActionButton",
//       "properties": {
//         "child": {
//           "type": "Icon",
//           "properties": {
//             "icon": "add",
//             "size": "24px",
//             "color": "ff0000"
//           }
//         }
//       }
//     }
//   }
// }
//             '''),
//           ),
//         ),
//       ),
//     );
//   }
// }









