import 'package:flutter_gp_app/database/db_helper.dart';
import 'package:flutter_gp_app/models/diary_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Diary Entry', () {
    var diaries = [
      DiaryEntry(
        id: 0,
        title: 'title',
        contentPlainText: 'content',
        contentDelta: '',
        date: DateTime.now(),
      ),
      DiaryEntry(
        id: 1,
        title: 'title',
        contentPlainText: 'content',
        contentDelta: '',
        date: DateTime.now(),
      ),
      DiaryEntry(
        id: 2,
        title: 'title',
        contentPlainText: 'content',
        contentDelta: '',
        date: DateTime.now(),
      )
    ];

    test('Diary Entry IDs', () {
      // Test that the first diary entry has the correct ID
      expect(diaries[0].id, 0);
      expect(diaries[1].id, 1);
      expect(diaries[2].id, 2);
    });
  });

  group('Database', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    test('Database Table', () async {
      // Test that the database table is created correctly
      await DbHelper().insertDiary(DiaryEntry(
        id: 0,
        title: 'title',
        contentPlainText: 'content',
        contentDelta: '',
        date: DateTime.now(),
      ));
      final arr = await DbHelper().getAllDiaries();
      arr.forEach((element) {
        element.toString();
      });
    });
  });
}
