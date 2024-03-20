import 'package:flutter/foundation.dart';
import 'package:flutter_gp_app/database/db_helper.dart';
import 'package:flutter_gp_app/dummy_data.dart';
import 'package:flutter_gp_app/models/diary_entry.dart';

class DiaryEntryProvider with ChangeNotifier {
  List<DiaryEntry> _diaryEntries = [];
  List<List<DiaryEntry>> _diaryEntriesByMonth = [];

  Future<List<DiaryEntry>> get diaryEntries async {
    if (_diaryEntries.isEmpty) {
      _diaryEntries = await DbHelper().getAllDiaries();
      if (_diaryEntries.isEmpty) {
        await DummyData.insertDummyDataIntoDB();
        _diaryEntries = await DbHelper().getAllDiaries();
      }
      _diaryEntries.sort((a, b) => b.date.compareTo(a.date));
    }
    return _diaryEntries;
  }

  Future<List<List<DiaryEntry>>> get diaryEntriesByMonth async {
    if (_diaryEntriesByMonth.isNotEmpty) return _diaryEntriesByMonth;

    final Map<String, List<DiaryEntry>> diaryEntriesByMonth = {};
    final diaries = await diaryEntries;
    for (var diaryEntry in diaries) {
      final key = '${diaryEntry.date.year}-${diaryEntry.date.month}';
      if (diaryEntriesByMonth.containsKey(key)) {
        diaryEntriesByMonth[key]!.add(diaryEntry);
      } else {
        diaryEntriesByMonth[key] = [diaryEntry];
      }
    }
    _diaryEntriesByMonth = diaryEntriesByMonth.values.toList();
    return _diaryEntriesByMonth;
  }

  Future<int> get getDiaryCountByMonth async {
    final diaryEntries = await diaryEntriesByMonth;
    return diaryEntries.length;
  }

  void addUpdateDiaryEntry({
    int? id,
    required String title,
    required String contentDelta,
    required String contentPlainText,
    required DateTime date,
  }) {
    final diaryEntry = DiaryEntry(
      id: id ?? DateTime.now().millisecondsSinceEpoch,
      title: title,
      contentDelta: contentDelta,
      contentPlainText: contentPlainText,
      date: date,
    );
    if (id != null) {
      final index = _diaryEntries.indexWhere((element) => element.id == id);
      _diaryEntries[index] = diaryEntry;
      for (var element in _diaryEntriesByMonth) {
        final index = element.indexWhere((element) => element.id == id);
        if (index != -1) {
          element[index] = diaryEntry;
        }
      }
      DbHelper().updateDiary(diaryEntry);
    } else {
      try {
        _diaryEntries.insert(0, diaryEntry);
        _diaryEntriesByMonth.isNotEmpty
            ? _diaryEntriesByMonth[0].insert(0, diaryEntry)
            : _diaryEntriesByMonth.add([diaryEntry]);
        DbHelper().insertDiary(diaryEntry);
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  void removeDiaryEntry(diaryId) {
    _diaryEntries.removeWhere((element) => element.id == diaryId);
    for (var element in _diaryEntriesByMonth) {
      element.removeWhere((element) => element.id == diaryId);
    }
    DbHelper().deleteDiary(diaryId);
    notifyListeners();
  }
}
