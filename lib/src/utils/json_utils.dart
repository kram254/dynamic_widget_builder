import 'dart:convert';

class JsonUtils {
  static Map<String, dynamic> parseJson(String jsonString) {
    return json.decode(jsonString);
  }
}