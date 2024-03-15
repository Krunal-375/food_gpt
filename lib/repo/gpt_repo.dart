import 'dart:convert';
import 'dart:developer';
import 'package:food_gpt/constants/constants.dart';
import 'package:http/http.dart' as http;

class GPTRepo {
  // POST 'createNupdate'
  static Future<dynamic> textGenerationRepo(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": gptModel,
          "messages": [
            {
              "role": "system",
              "content":
                  "Give response in json {\"Items\": \"\",\"Calories\": \"\",\"Protein(in g)\":\"\",\"Carb(in g)\":\"\",\"Fat(in g)\":\"\"} format only dont print backslash."
            },
            {
              "role": "user",
              "content": userMessage,
            }
          ]
        }),
      );
      return json.decode(response.body)['choices'][0]['message']['content'];
    } catch (e) {
      log('Error: $e');
      rethrow; // Rethrow the error if you want to handle it further up the call stack
    }
  }
}
