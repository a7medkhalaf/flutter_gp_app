part of 'diary_bloc.dart';

@immutable
sealed class DiaryState {}

final class DiaryInitial extends DiaryState {}

final class DiaryLoading extends DiaryState {}

final class DiaryLoaded extends DiaryState {
  final List<List<DiaryEntry>> diaryEntriesPerMonth;
  final List<DiaryEntry> diaryEntriesPerDay;

  DiaryLoaded({
    this.diaryEntriesPerMonth = const [],
    this.diaryEntriesPerDay = const [],
  });
}

final class DiaryFailure extends DiaryState {
  final String message;

  DiaryFailure(this.message);
}
