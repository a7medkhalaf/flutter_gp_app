part of 'diary_bloc.dart';

@immutable
sealed class DiaryEvent {}

final class DiaryInsert extends DiaryEvent {
  final DiaryEntry diary;

  DiaryInsert(this.diary);
}

final class DiaryUpdate extends DiaryEvent {
  final DiaryEntry diary;

  DiaryUpdate(this.diary);
}

final class DiaryDelete extends DiaryEvent {
  final int id;

  DiaryDelete(this.id);
}

final class DiaryGetAll extends DiaryEvent {}

final class DiaryGetAllByMonth extends DiaryEvent {}

final class DiaryGetAllByDay extends DiaryEvent {
  final DateTime day;

  DiaryGetAllByDay(this.day);
}

final class DiaryDeleteAll extends DiaryEvent {}

final class DiaryReset extends DiaryEvent {}
