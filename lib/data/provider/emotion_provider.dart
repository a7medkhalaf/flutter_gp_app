import 'dart:convert';

import 'package:flutter_gp_app/data/models/emotion.dart';
import 'package:http/http.dart' as http;

Future<EmotionEnum> classify(String diary) async {
  late final http.Response response;
  try {
    response = await http.post(
      Uri.parse('http://localhost:5000/predict'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'text': diary,
        },
      ),
    );
  } catch (e) {
    return EmotionEnum.neutral;
  }
  var jsonData = jsonDecode(response.body);
  var emotion = jsonData['emotion'].toString();

  if (emotion == 'sad') {
    return EmotionEnum.sad;
  } else if (emotion == 'joy') {
    return EmotionEnum.joy;
  } else if (emotion == 'love') {
    return EmotionEnum.love;
  } else if (emotion == 'anger') {
    return EmotionEnum.anger;
  } else if (emotion == 'fear') {
    return EmotionEnum.fear;
  } else if (emotion == 'surprise') {
    return EmotionEnum.surprise;
  } else {
    return EmotionEnum.neutral;
  }
}

Future<List<String>> getActivities(String emotion) async {
  late final http.Response response;
  try {
    response = await http.get(
      Uri.parse('http://localhost:5000/suggest?emotion=$emotion'),
    );
  } catch (e) {
    return [];
  }
  var jsonData = jsonDecode(response.body);
  return jsonData['activities'].cast<String>();
}
