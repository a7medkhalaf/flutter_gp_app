part of 'diary_bloc.dart';

@immutable
sealed class DiaryState {}

final class DiaryInitial extends DiaryState {}

final class DiaryLoading extends DiaryState {}

final class DiaryLoaded extends DiaryState {
  final List<List<DiaryEntry>> diaryEntries;

  DiaryLoaded(this.diaryEntries);
}

final class DiaryFailure extends DiaryState {
  final String message;

  DiaryFailure(this.message);
}
