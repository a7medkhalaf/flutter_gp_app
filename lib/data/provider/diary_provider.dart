import 'dart:developer';
import 'dart:io';

import 'package:flutter_gp_app/data/models/diary_entry.dart';
import 'package:flutter_gp_app/data/models/emotion.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DiaryProvider {
  late Box<DiaryEntry> _diaries;

  Future<void> initHive() async {
    if (Platform.isLinux) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    } else {
      await Hive.initFlutter();
    }
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(EmotionEnumAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(EmotionAdapter());
    if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(DiaryEntryAdapter());
  }

  Future<void> _openDiaryBox() async {
    _diaries = await Hive.openBox('diaries');
  }

  Future<void> backupDatabase() async {
    await _openDiaryBox();
    final boxPath = _diaries.path;
    try {
      if (Platform.isLinux) {
        await File(boxPath!).copy('/home/khalaf/diaries.hive');
      } else {
        final backupPath = await getExternalStorageDirectory();
        await File(boxPath!).copy('${backupPath!.path}/diaries.hive');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> restoreDatabase() async {
    await _openDiaryBox();
    final boxPath = _diaries.path;
    try {
      if (Platform.isLinux) {
        await File('/home/khalaf/diaries.hive').copy(boxPath!);
      } else {
        final backupPath = await getExternalStorageDirectory();
        await File('${backupPath!.path}/diaries.hive').copy(boxPath!);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      await _openDiaryBox();
    }
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
