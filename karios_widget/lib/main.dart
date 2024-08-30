import 'package:flutter/material.dart';
import 'package:dynamic_widget_builder/dynamic_widget_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Widget Builder Test'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'XML Input',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              DynamicWidgetBuilder.buildFromXml('''

<Row>
    <Expanded flex="1">
      <Container color="#FF0000">
        <Text text="First Row Item" color="#FFFFFF" fontSize="16"/>
      </Container>
    </Expanded>
    <SizedBox width="10"/>
    <Expanded flex="2">
      <Container color="#00FF00">
        <Text text="Second Row Item with More Space" color="#000000" fontSize="16"/>
      </Container>
    </Expanded>
    <SizedBox width="10"/>
    <Expanded flex="1">
      <Container color="#0000FF">
        <Text text="Third Row Item" color="#FFFFFF" fontSize="16"/>
      </Container>
    </Expanded>
  </Row>



              '''),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'JSON Input',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              DynamicWidgetBuilder.buildFromJson('''
{
  "type": "Column",
  "properties": {
    "children": [
      {
        "type": "Text",
        "properties": {
          "text": "Hello from JSON!",
          "style": {
            "color": "#FF00FF",
            "fontSize": 18
          }
        }
      },
      {
        "type": "Container",
        "properties": {
          "color": "#00FF00",
          "padding": "10,10,10,10",
          "child": {
            "type": "Column",
            "properties": {
              "children": [
                {
                  "type": "Text",
                  "properties": {
                    "text": "Nested Container Text",
                    "style": {
                      "color": "#000000",
                      "fontSize": 16
                    }
                  }
                },
                {
                  "type": "Row",
                  "properties": {
                    "children": [
                      {
                        "type": "Text",
                        "properties": {
                          "text": "Row Item 1",
                          "style": {
                            "color": "#FF0000"
                          }
                        }
                      },
                      {
                        "type": "Text",
                        "properties": {
                          "text": "Row Item 2",
                          "style": {
                            "color": "#00FF00"
                          }
                        }
                      },
                      {
                        "type": "Text",
                        "properties": {
                          "text": "Row Item 3",
                          "style": {
                            "color": "#0000FF"
                          }
                        }
                      }
                    ]
                  }
                }
              ]
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
    );
  }
}