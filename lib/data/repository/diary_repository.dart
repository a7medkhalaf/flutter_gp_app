import 'package:flutter_gp_app/data/models/diary_entry.dart';
import 'package:flutter_gp_app/data/provider/diary_provider.dart';

class DiaryRepository {
  final DiaryProvider _diaryProvider;
  DiaryRepository() : _diaryProvider = DiaryProvider();
  DiaryProvider get diaryProvider => _diaryProvider;

  Future<void> initHive() async {
    await _diaryProvider.initHive();
  }

  Future<void> backupDatabase() async {
    await _diaryProvider.backupDatabase();
  }

  Future<void> restoreDatabase() async {
    await _diaryProvider.restoreDatabase();
  }

  Future<void> insertDiary(DiaryEntry diary) async {
    await _diaryProvider.insertDiary(diary);
  }

  Future<void> updateDiary(DiaryEntry diary) async {
    await _diaryProvider.updateDiary(diary);
  }

  Future<void> deleteDiary(int id) async {
    await _diaryProvider.deleteDiary(id);
  }

  Future<List<DiaryEntry>> _getAllDiaries() async {
    final diaries = await _diaryProvider.getAllDiaries();
    diaries.sort((a, b) => b.date.compareTo(a.date));
    return diaries;
  }

  Future<List<List<DiaryEntry>>> getDiariesByMonth() async {
    final diaries = await _getAllDiaries();
    final diaryEntriesByMonth = <List<DiaryEntry>>[];
    final diaryEntriesByMonthMap = <String, List<DiaryEntry>>{};
    for (var diaryEntry in diaries) {
      final key = '${diaryEntry.date.year}-${diaryEntry.date.month}';
      if (diaryEntriesByMonthMap.containsKey(key)) {
        diaryEntriesByMonthMap[key]!.add(diaryEntry);
      } else {
        diaryEntriesByMonthMap[key] = [diaryEntry];
      }
    }
    diaryEntriesByMonth.addAll(diaryEntriesByMonthMap.values.toList());
    return diaryEntriesByMonth;
  }

  Future<List<DiaryEntry>> getDiariesByDay(DateTime day) async {
    final diaries = await _getAllDiaries();
    return diaries
        .where((diary) =>
            diary.date.day == day.day &&
            diary.date.month == day.month &&
            diary.date.year == day.year)
        .toList();
  }

  Future<void> deleteAllDiaries() async {
    await _diaryProvider.deleteAllDiaries();
  }
}
