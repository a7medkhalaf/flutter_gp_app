import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gp_app/presentation/widgets/constants.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

part 'diary_entry_hive.g.dart';

@HiveType(typeId: 0)
enum Emotion {
  @HiveField(0)
  joy,
  @HiveField(1)
  sad,
  @HiveField(2)
  angry,
  @HiveField(3)
  surprised,
  @HiveField(4)
  fear,
  @HiveField(5)
  love,
  @HiveField(6)
  neutral
}

@HiveType(typeId: 1)
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
  @HiveField(5, defaultValue: Emotion.neutral)
  Emotion emotion;

  DiaryEntry({
    required this.id,
    required this.title,
    required this.contentPlainText,
    required this.contentDelta,
    required this.date,
    this.emotion = Emotion.neutral,
  });

  Widget getEmotion() {
    switch (emotion) {
      case Emotion.neutral:
        return SvgPicture.asset(
          emojiNeutral,
          color: Colors.black,
        );
      case Emotion.joy:
        return SvgPicture.asset(emojiHappy, color: Colors.green);
      case Emotion.sad:
        return SvgPicture.asset(emojiSad, color: Colors.blue);
      case Emotion.angry:
        return SvgPicture.asset(emojiAngry, color: Colors.red);
      case Emotion.surprised:
        return SvgPicture.asset(emojiSurprised, color: Colors.yellow);
      case Emotion.fear:
        return SvgPicture.asset(emojiFear, color: Colors.orange);
      case Emotion.love:
        return SvgPicture.asset(emojiLove, color: Colors.pink);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content_plain_text': contentPlainText,
      'content_delta': contentDelta,
      'date': date.toIso8601String(),
      'emotion': emotion.index,
    };
  }

  factory DiaryEntry.fromMap(Map<String, dynamic> map) {
    return DiaryEntry(
      id: map['id'],
      title: map['title'],
      contentPlainText: map['content_plain_text'],
      contentDelta: map['content_delta'],
      date: DateTime.parse(map['date']),
      emotion: Emotion.values[map['emotion']],
    );
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
  }) {
    return DiaryEntry(
      id: id ?? this.id,
      title: title ?? this.title,
      contentPlainText: contentPlainText ?? this.contentPlainText,
      contentDelta: contentDelta ?? this.contentDelta,
      date: date ?? this.date,
      emotion: emotion ?? this.emotion,
    );
  }

  factory DiaryEntry.create(String title, Document document) {
    return DiaryEntry(
      id: DateTime.now().microsecondsSinceEpoch,
      title: title,
      contentPlainText: document.toPlainText(),
      contentDelta: jsonEncode(document.toDelta()),
      date: DateTime.now(),
      emotion: Emotion.neutral,
    );
  }
}
