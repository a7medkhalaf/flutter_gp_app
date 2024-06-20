import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gp_app/extensions/color_extension.dart';
import 'package:flutter_gp_app/data/models/emotion.dart';
import 'package:flutter_gp_app/presentation/widgets/constants.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

part 'diary_entry.g.dart';

@HiveType(typeId: 2)
class DiaryEntry extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String contentPlainText;
  @HiveField(3)
  String contentDelta;
  @HiveField(4)
  DateTime date;
  @HiveField(5)
  Emotion emotion;
  @HiveField(6)
  List<String> activities;

  DiaryEntry({
    required this.id,
    required this.title,
    required this.contentPlainText,
    required this.contentDelta,
    required this.date,
    required this.emotion,
    this.activities = const ['...', '...', '...'],
  });

  Widget getEmotion() {
    const defaultColor = Colors.black;
    var emotionColor = defaultColor.stringToColor(emotion.color);

    return SvgPicture.asset(
      _getEmotionAsset(emotion.name),
      colorFilter: ColorFilter.mode(emotionColor, BlendMode.srcIn),
    );
  }

  String _getEmotionAsset(String emotionName) {
    switch (emotionName) {
      case 'Sad':
        return emojiSad;
      case 'Joy':
        return emojiJoy;
      case 'Love':
        return emojiLove;
      case 'Angry':
        return emojiAngry;
      case 'Fear':
        return emojiFear;
      case 'Surprise':
        return emojiSurprise;
      default:
        return emojiNeutral;
    }
  }

  @override
  String toString() {
    return 'DiaryEntry{id: $id, title: $title, contentPlainText: $contentPlainText, contentDelta: $contentDelta, date: $date, emotion: $emotion}';
  }

  DiaryEntry copyWith({
    int? id,
    String? title,
    String? contentPlainText,
    String? contentDelta,
    DateTime? date,
    Emotion? emotion,
    List<String>? activities,
  }) {
    return DiaryEntry(
      id: id ?? this.id,
      title: title ?? this.title,
      contentPlainText: contentPlainText ?? this.contentPlainText,
      contentDelta: contentDelta ?? this.contentDelta,
      date: date ?? this.date,
      emotion: emotion ?? this.emotion,
      activities: activities ?? this.activities,
    );
  }

  factory DiaryEntry.create(
    String title,
    Document document,
    Emotion emotion,
    List<String> activities,
  ) {
    return DiaryEntry(
      id: DateTime.now().microsecondsSinceEpoch,
      title: title,
      contentPlainText: document.toPlainText(),
      contentDelta: jsonEncode(document.toDelta()),
      date: DateTime.now(),
      emotion: emotion,
      activities: activities,
    );
  }
}
