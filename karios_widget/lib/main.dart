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
      // Wrap MaterialApp with ScreenUtilInit
      designSize: const flutter.Size(360, 690), // Set your design size
      builder: (context, child) => flutter.MaterialApp(
        home: flutter.Scaffold(
          appBar: flutter.AppBar(
              title: const flutter.Text('Dynamic Widget Builder Test')),
          body: flutter.Center(
            child: DynamicWidgetBuilder.parse('''
              {
  "type": "Scaffold",
  "properties": {
    "appBar": {
      "type": "AppBar",
      "properties": {
        "title": {
          "type": "Text",
          "properties": {
            "data": "Dynamic Widget Builder",
            "fontSize": "20.sp"
          }
        }
      }
    },
    "body": {
      "type": "Center",
      "properties": {
        "child": {
          "type": "Column",
          "properties": {
            "children": [
              {
                "type": "Text",
                "properties": {
                  "data": "Hello, World!",
                  "fontSize": "16.sp"
                }
              },
              {
                "type": "Text",
                "properties": {
                  "data": "Welcome to Dynamic Widget Builder",
                  "fontSize": "14.sp"
                }
              }
            ]
          }
        }
      }
    },
    "floatingActionButton": {
      "type": "FloatingActionButton",
      "properties": {
        "child": {
          "type": "Icon",
          "properties": {
            "icon": "add",
            "size": "24px",
            "color": "ff0000"
          }
        }
      }
    }
  }
}
            '''),
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
//     return ScreenUtilInit( // Wrap MaterialApp with ScreenUtilInit
//       designSize: const flutter.Size(360, 690), // Set your design size
//       builder: (context, child) => flutter.MaterialApp(
//         home: flutter.Scaffold(
//           appBar: flutter.AppBar(title: const flutter.Text('Dynamic Widget Builder Test')),
//           body: flutter.Center(
//             child: DynamicWidgetBuilder.parse('''
//               {
//                 "type": "Column",
//                 "properties": {
//                   "children": [
//                     {
//                       "type": "Card",
//                       "properties": {
//                         "height": "250px",
//                         "width": "300px",
//                         "color": "79ba8a",
//                         "fontSize": "16.sp"
//                       }
//                     },
//                     {
//                       "type": "Card",
//                       "properties": {
//                         "height": "300px",
//                         "width": "500px",
//                         "color": "#b3ad1b",
//                         "fontSize": "14.sp"
//                       }
//                     }
//                   ]
//                 }
//               }
//             '''),
//           ),
//         ),
//       ),
//     );
//   }
// }












