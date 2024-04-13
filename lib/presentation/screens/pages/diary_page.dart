import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/bloc/diary_bloc.dart';
import 'package:flutter_gp_app/presentation/widgets/diary_list_view_per_month.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<DiaryBloc>().state as DiaryLoaded;

    return ListView.builder(
      itemBuilder: (context, i) {
        return DiaryListViewPerMonth(i);
      },
      itemCount: state.diaryEntries.length,
    );
  }
}
