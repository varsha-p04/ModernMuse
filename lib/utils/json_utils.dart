

import 'dart:convert';

class JsonUtils {
  static Map<String, dynamic> parseJsonString(String jsonString) {
    try {
      return jsonDecode(jsonString);
    } catch (e) {
      print('Error parsing JSON: $e');
      throw FormatException('Error parsing JSON: $e');
    }
  }
}
