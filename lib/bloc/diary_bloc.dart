import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/data/models/diary_entry.dart';
import 'package:flutter_gp_app/data/repository/diary_repository.dart';
import 'package:flutter_gp_app/data/dummy_data/dummy_data.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final DiaryRepository _diaryRepository;

  DiaryBloc(this._diaryRepository) : super(DiaryInitial()) {
    on<DiaryGetAllByMonth>(_loadDiaryByMonth);
    on<DiaryInsert>(_insertDiary);
    on<DiaryUpdate>(_updateDiary);
    on<DiaryDelete>(_deleteDiary);
    on<DiaryReset>(_resetDiary);
  }

  @override
  void onChange(Change<DiaryState> change) {
    super.onChange(change);
    log('DiaryBloc - $change');
  }

  void _loadDiaryByMonth(
    DiaryGetAllByMonth event,
    Emitter<DiaryState> emit,
  ) async {
    emit(DiaryLoading());
    try {
      final diaryEntries = await _diaryRepository.getAllDiariesByMonth();
      emit(DiaryLoaded(diaryEntries));
    } catch (e) {
      emit(DiaryFailure(e.toString()));
    }
  }

  void _insertDiary(
    DiaryInsert event,
    Emitter<DiaryState> emit,
  ) async {
    emit(DiaryLoading());
    try {
      await _diaryRepository.insertDiary(event.diary);
      emit(DiaryInitial());
    } catch (e) {
      emit(DiaryFailure(e.toString()));
    }
  }

  void _updateDiary(
    DiaryUpdate event,
    Emitter<DiaryState> emit,
  ) async {
    emit(DiaryLoading());
    try {
      await _diaryRepository.updateDiary(event.diary);
      emit(DiaryInitial());
    } catch (e) {
      emit(DiaryFailure(e.toString()));
    }
  }

  void _deleteDiary(
    DiaryDelete event,
    Emitter<DiaryState> emit,
  ) {
    emit(DiaryLoading());
    try {
      _diaryRepository.deleteDiary(event.id);
      emit(DiaryInitial());
    } catch (e) {
      emit(DiaryFailure(e.toString()));
    }
  }

  void _resetDiary(
    DiaryReset event,
    Emitter<DiaryState> emit,
  ) async {
    emit(DiaryLoading());
    try {
      await _diaryRepository.deleteAllDiaries();
      await DummyData.insertDummyDataIntoDB();
      emit(DiaryInitial());
    } catch (e) {
      emit(DiaryFailure(e.toString()));
    }
  }
}
