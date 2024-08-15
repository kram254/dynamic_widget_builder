import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_widget_builder/dynamic_widget_builder.dart';

void main() {
  test('DynamicWidgetBuilder parse test', () {
    final jsonString = '''
      {
        "type": "Column",
        "properties": {
          "children": [
            {
              "type": "Card",
              "properties": {
                "height": "50px",
                "width": "100px",
                "color": "ff0000",
                "fontSize": "16.sp"
              }
            },
            {
              "type": "Card",
              "properties": {
                "height": "30px",
                "width": "80px",
                "color": "0000ff",
                "fontSize": "14.sp"
              }
            }
          ]
        }
      }
    ''';

    final widget = DynamicWidgetBuilder.parse(jsonString);
    expect(widget, isNotNull);
  });
}
