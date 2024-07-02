import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/bloc/diary_bloc.dart';
import 'package:flutter_gp_app/presentation/widgets/diary_item.dart';
import 'package:intl/intl.dart';

class DiaryListViewPerMonth extends StatelessWidget {
  final int monthIndex;
  const DiaryListViewPerMonth(this.monthIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryBloc, DiaryState>(
      builder: (context, state) {
        if (state is DiaryLoaded) {
          try {
            state.diaryEntriesPerMonth.elementAt(monthIndex);
          } catch (e) {
            return const SizedBox();
          }
          if (state.diaryEntriesPerMonth.elementAt(monthIndex).isEmpty) {
            return const SizedBox();
          }

          return Column(
            children: [
              AppBar(
                title: Text(
                  DateFormat.yMMMM().format(state.diaryEntriesPerMonth
                      .elementAt(monthIndex)
                      .elementAt(0)
                      .date),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontStyle: FontStyle.italic),
                ),
                centerTitle: true,
              ),
              ListView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, diaryIndex) {
                  return DiaryListItem(state.diaryEntriesPerMonth
                      .elementAt(monthIndex)
                      .elementAt(diaryIndex));
                },
                itemCount:
                    state.diaryEntriesPerMonth.elementAt(monthIndex).length,
              ),
              const Divider(
                indent: 80,
                endIndent: 80,
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
