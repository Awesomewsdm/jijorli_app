import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jijorli_app/constants/api_constants.dart';

class OpenAIRepository {
  static var client = http.Client();

  static Future<Map<String, dynamic>> sendPromptMessage(String prompt) async {
    try {
      var headers = {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json'
      };

      //   var data = {
      //     "model": "text-davinci-003",
      //     "prompt": prompt,
      //     "temperature": 0,
      //     "max_tokens": 2000
      //   };

      //   var url = Uri.parse('${endpoint}completions');
      // var request = await http.post(url, headers: headers, body: jsonEncode(data));

      var request = http.Request('POST', Uri.parse('${endpoint}completions'));
      request.body = json.encode({
        "model": "text-davinci-003",
        "prompt": prompt,
        "temperature": 0,
        "max_tokens": 2000
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();

        return json.decode(data);
      } else {
        return {
          "status": false,
          "message": "Oops, there was an error",
        };
      }
    } catch (_) {
      return {
        "status": false,
        "message": "Oops, there was an error",
      };
    }
  }
}
