import 'dart:io';

import 'package:flutter_gp_app/models/diary_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveProvider {
  // Singleton
  static final HiveProvider _shared = HiveProvider._sharedInstance();
  HiveProvider._sharedInstance();
  factory HiveProvider() => _shared;

  late Box<DiaryEntry> _diaries;

  Future<void> initHive() async {
    if (Platform.isLinux) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    } else {
      await Hive.initFlutter();
    }
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(EmotionAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(DiaryEntryAdapter());
  }

  Future<void> _openDiaryBox() async {
    _diaries = await Hive.openBox('diaries');
  }

  // Future<void> removeDatabase() async {
  //   await _openDiaryBox();
  //   await Hive.deleteFromDisk();
  // }

  Future<void> insertDiary(DiaryEntry diary) async {
    await _openDiaryBox();
    await _diaries.put('${diary.id}', diary);
  }

  Future<void> updateDiary(DiaryEntry diary) async {
    await _openDiaryBox();
    await _diaries.put('${diary.id}', diary);
  }

  Future<void> deleteDiary(int id) async {
    await _openDiaryBox();
    await _diaries.delete('$id');
  }

  Future<List<DiaryEntry>> getAllDiaries() async {
    await _openDiaryBox();
    return _diaries.values.toList();
  }

  Future<void> deleteAllDiaries() async {
    await _openDiaryBox();
    await _diaries.clear();
  }
}
