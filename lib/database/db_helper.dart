import 'dart:io';

import 'package:flutter_gp_app/models/diary_entry.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String _dbName = 'diary.db';
const String _diaryTable = 'diary_entries';
const String _createDiaryTable = ''
    'CREATE TABLE diary_entries('
    'id INTEGER PRIMARY KEY,'
    'title TEXT,'
    'content_plain_text TEXT,'
    'content_delta TEXT,'
    'date TEXT'
    ')';

class DbHelper {
  // Singleton
  static final DbHelper _shared = DbHelper._sharedInstance();
  DbHelper._sharedInstance();
  factory DbHelper() => _shared;

  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory docsPath = await getApplicationDocumentsDirectory();
    String dbPath = join(docsPath.path, _dbName);

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_createDiaryTable);
      },
    );
  }

  Future<int> insertDiary(diary) async {
    final db = await database;
    return await db.insert(
      _diaryTable,
      diary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateDiary(diary) async {
    final db = await database;
    return await db.update(
      _diaryTable,
      diary.toMap(),
      where: 'id = ?',
      whereArgs: [diary.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteDiary(id) async {
    final db = await database;
    return await db.delete(
      _diaryTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<DiaryEntry>> getAllDiaries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_diaryTable);
    return List.generate(maps.length, (i) {
      return DiaryEntry(
        id: maps[i]['id'],
        title: maps[i]['title'],
        contentPlainText: maps[i]['content_plain_text'],
        contentDelta: maps[i]['content_delta'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }
}
