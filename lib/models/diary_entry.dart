class DiaryEntry {
  int id;
  String title;
  String contentPlainText;
  String contentDelta;
  DateTime date;

  DiaryEntry({
    required this.id,
    required this.title,
    required this.contentPlainText,
    required this.contentDelta,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content_plain_text': contentPlainText,
      'content_delta': contentDelta,
      'date': date.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'DiaryEntry{id: $id, title: $title, contentPlainText: $contentPlainText, contentDelta: $contentDelta, date: $date}';
  }
}
