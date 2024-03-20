import 'package:flutter_gp_app/database/db_helper.dart';
import 'package:flutter_gp_app/models/diary_entry.dart';

class DummyData {
  static var dummyDiaryEntries = [
    DiaryEntry(
      id: 1,
      title: 'Exciting Day at the Beach',
      contentPlainText:
          'Today was amazing! I spent the entire day at the beach with my family. We built sandcastles, swam in the ocean, and had a picnic. The sunset was breathtaking, and I collected seashells as souvenirs. It was a perfect day.',
      contentDelta:
          '[{"insert":"Today was amazing! I spent the entire day at the beach with my family. We built sandcastles, swam in the ocean, and had a picnic. The sunset was breathtaking, and I collected seashells as souvenirs. It was a perfect day.\\n"}]',
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    DiaryEntry(
      id: 2,
      title: 'A Quiet Day of Reflection',
      contentPlainText:
          'Spent the day reading my favorite book in the backyard. The gentle breeze and chirping birds made it incredibly peaceful. It\'s moments like these that remind me to appreciate the little things in life.',
      contentDelta:
          '[{"insert":"Spent the day reading my favorite book in the backyard. The gentle breeze and chirping birds made it incredibly peaceful. It\'s moments like these that remind me to appreciate the little things in life.\\n\\n"}]',
      date: DateTime.now().subtract(const Duration(days: 9)),
    ),
    DiaryEntry(
      id: 3,
      title: 'Exploring the City',
      contentPlainText:
          'Wandered around the city today, exploring new neighborhoods and trying exotic foods. I stumbled upon a quaint bookstore and spent hours browsing through novels. The city\'s energy is infectious.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 12)),
    ),
    DiaryEntry(
      id: 4,
      title: 'Lazy Sunday',
      contentPlainText:
          'Today was all about relaxation. I stayed in bed until noon, binge-watched my favorite TV series, and indulged in comfort food. Sometimes, you just need a day to recharge.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 17)),
    ),
    DiaryEntry(
      id: 5,
      title: 'Hiking Adventure',
      contentPlainText:
          'Embarked on a challenging hike today, surrounded by stunning mountain views. The fresh air and exercise were invigorating. Despite the sore muscles, it was worth every step.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 21)),
    ),
    DiaryEntry(
      id: 6,
      title: 'Family Reunion',
      contentPlainText:
          'Attended a family reunion today, catching up with relatives from near and far. We shared stories, laughed over old memories, and enjoyed a delicious feast together. Family is everything.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 25)),
    ),
    DiaryEntry(
      id: 7,
      title: 'Artistic Inspiration',
      contentPlainText:
          'Visited an art gallery and was inspired by the creativity and talent on display. I spent the afternoon sketching in the park, letting my imagination run wild. Art has a way of speaking to the soul.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 30)),
    ),
    DiaryEntry(
      id: 8,
      title: 'Volunteer Day',
      contentPlainText:
          'Spent the day volunteering at a local shelter, helping those in need. It was humbling to make a difference in someone else\'s life, even in a small way. Kindness is contagious.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 33)),
    ),
    DiaryEntry(
      id: 9,
      title: 'Culinary Experiment',
      contentPlainText:
          'Decided to try my hand at cooking a new recipe today. Despite a few mishaps in the kitchen, the end result was surprisingly delicious. Cooking truly is a form of creative expression.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 37)),
    ),
    DiaryEntry(
      id: 10,
      title: 'Starlit Stargazing',
      contentPlainText:
          'Spent the evening stargazing in the backyard, marveling at the vastness of the universe. Each twinkling star felt like a reminder of how small we are in the grand scheme of things. It was a moment of tranquility amidst the chaos of life.',
      contentDelta: '',
      date: DateTime.now().subtract(const Duration(days: 42)),
    ),
  ];

  static insertDummyDataIntoDB() async {
    for (int i = 0; i < dummyDiaryEntries.length; i++) {
      await DbHelper().insertDiary(dummyDiaryEntries[i]);
    }
  }
}
