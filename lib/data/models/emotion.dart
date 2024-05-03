import 'package:flutter/material.dart';
import 'package:flutter_gp_app/presentation/widgets/constants.dart';
import 'package:hive/hive.dart';

part 'emotion.g.dart';

@HiveType(typeId: 0)
enum EmotionEnum {
  @HiveField(0)
  joy,
  @HiveField(1)
  sad,
  @HiveField(2)
  anger,
  @HiveField(3)
  surprise,
  @HiveField(4)
  fear,
  @HiveField(5)
  love,
  @HiveField(6)
  neutral,
}

@HiveType(typeId: 1)
class Emotion {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String color;
  @HiveField(2)
  final String assetPath;

  const Emotion({
    required this.name,
    required this.color,
    required this.assetPath,
  });

  factory Emotion.fromEnum(EmotionEnum emotion) {
    switch (emotion) {
      case EmotionEnum.sad:
        return Emotion(
          name: 'Sad',
          color: Colors.blue.value.toString(),
          assetPath: emojiSad,
        );
      case EmotionEnum.joy:
        return Emotion(
          name: 'Joy',
          color: Colors.green.value.toString(),
          assetPath: emojiJoy,
        );
      case EmotionEnum.love:
        return Emotion(
          name: 'Love',
          color: Colors.pink.value.toString(),
          assetPath: emojiLove,
        );
      case EmotionEnum.anger:
        return Emotion(
          name: 'Angry',
          color: Colors.red.value.toString(),
          assetPath: emojiAngry,
        );
      case EmotionEnum.fear:
        return Emotion(
          name: 'Fear',
          color: Colors.orange.value.toString(),
          assetPath: emojiFear,
        );
      case EmotionEnum.surprise:
        return Emotion(
          name: 'Surprised',
          color: Colors.yellow.value.toString(),
          assetPath: emojiSurprise,
        );
      case EmotionEnum.neutral:
        return Emotion(
          name: 'Neutral',
          color: Colors.black.value.toString(),
          assetPath: emojiNeutral,
        );
    }
  }
}
