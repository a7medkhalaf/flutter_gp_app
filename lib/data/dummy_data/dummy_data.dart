import 'package:flutter_gp_app/data/repository/diary_repository.dart';
import 'package:flutter_gp_app/data/models/diary_entry.dart';
import 'package:flutter_gp_app/data/dummy_data/constants.dart';

class DummyData {
  static var dummyDiaryEntries = [
    DiaryEntry(
      id: 1,
      title: title1,
      contentPlainText: contentPlainText1,
      contentDelta: contentDelta1,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    DiaryEntry(
      id: 2,
      title: title2,
      contentPlainText: contentPlainText2,
      contentDelta: contentDelta2,
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
    DiaryEntry(
      id: 3,
      title: title3,
      contentPlainText: contentPlainText3,
      contentDelta: contentDelta3,
      date: DateTime.now().subtract(const Duration(days: 13)),
    ),
    DiaryEntry(
      id: 4,
      title: title4,
      contentPlainText: contentPlainText4,
      contentDelta: contentDelta4,
      date: DateTime.now().subtract(const Duration(days: 15)),
    ),
    DiaryEntry(
      id: 5,
      title: title5,
      contentPlainText: contentPlainText5,
      contentDelta: contentDelta5,
      date: DateTime.now().subtract(const Duration(days: 17)),
    ),
    DiaryEntry(
      id: 6,
      title: title6,
      contentPlainText: contentPlainText6,
      contentDelta: contentDelta6,
      date: DateTime.now().subtract(const Duration(days: 25)),
    ),
    DiaryEntry(
      id: 7,
      title: title7,
      contentPlainText: contentPlainText7,
      contentDelta: contentDelta7,
      date: DateTime.now().subtract(const Duration(days: 29)),
    ),
    DiaryEntry(
      id: 8,
      title: title8,
      contentPlainText: contentPlainText8,
      contentDelta: contentDelta8,
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),
    DiaryEntry(
      id: 9,
      title: title9,
      contentPlainText: contentPlainText9,
      contentDelta: contentDelta9,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
    DiaryEntry(
      id: 10,
      title: title10,
      contentPlainText: contentPlainText10,
      contentDelta: contentDelta10,
      date: DateTime.now().subtract(const Duration(days: 45)),
    ),
    DiaryEntry(
      id: 11,
      title: title11,
      contentPlainText: contentPlainText11,
      contentDelta: contentDelta11,
      date: DateTime.now().subtract(const Duration(days: 46)),
    ),
    DiaryEntry(
      id: 12,
      title: title12,
      contentPlainText: contentPlainText12,
      contentDelta: contentDelta12,
      date: DateTime.now().subtract(const Duration(days: 49)),
    ),
    DiaryEntry(
      id: 13,
      title: title13,
      contentPlainText: contentPlainText13,
      contentDelta: contentDelta13,
      date: DateTime.now().subtract(const Duration(days: 55)),
    ),
    DiaryEntry(
      id: 14,
      title: title14,
      contentPlainText: contentPlainText14,
      contentDelta: contentDelta14,
      date: DateTime.now().subtract(const Duration(days: 60)),
    ),
    DiaryEntry(
      id: 15,
      title: title15,
      contentPlainText: contentPlainText15,
      contentDelta: contentDelta15,
      date: DateTime.now().subtract(const Duration(days: 61)),
    ),
    DiaryEntry(
      id: 16,
      title: title16,
      contentPlainText: contentPlainText16,
      contentDelta: contentDelta16,
      date: DateTime.now().subtract(const Duration(days: 63)),
    ),
    DiaryEntry(
      id: 17,
      title: title17,
      contentPlainText: contentPlainText17,
      contentDelta: contentDelta17,
      date: DateTime.now().subtract(const Duration(days: 69)),
    ),
    DiaryEntry(
      id: 18,
      title: title18,
      contentPlainText: contentPlainText18,
      contentDelta: contentDelta18,
      date: DateTime.now().subtract(const Duration(days: 77)),
    ),
    DiaryEntry(
      id: 19,
      title: title19,
      contentPlainText: contentPlainText19,
      contentDelta: contentDelta19,
      date: DateTime.now().subtract(const Duration(days: 80)),
    ),
    DiaryEntry(
      id: 20,
      title: title20,
      contentPlainText: contentPlainText20,
      contentDelta: contentDelta20,
      date: DateTime.now().subtract(const Duration(days: 88)),
    ),
  ];

  static insertDummyDataIntoDB() async {
    for (int i = 0; i < dummyDiaryEntries.length; i++) {
      await DiaryRepository().insertDiary(dummyDiaryEntries[i]);
    }
  }
}
