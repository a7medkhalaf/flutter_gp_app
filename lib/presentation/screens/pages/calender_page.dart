import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gp_app/bloc/diary_bloc.dart';
import 'package:flutter_gp_app/data/models/diary_entry.dart';
import 'package:flutter_gp_app/presentation/widgets/diary_item.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  List<DiaryEntry> _selectedDiaries = [];
  DateTime _selectedDay = DateTime.now();
  @override
  void initState() {
    BlocProvider.of<DiaryBloc>(context).add(
      DiaryGetAllByDay(_selectedDay),
    );
    super.initState();
  }

  void _onDateChange(DateTime selectedDate) {
    _selectedDay = selectedDate;

    BlocProvider.of<DiaryBloc>(context).add(
      DiaryGetAllByDay(_selectedDay),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: _onDateChange,
          activeColor: Theme.of(context).colorScheme.primary,
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.dayOnly(),
          ),
          dayProps: EasyDayProps(
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            todayHighlightColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        const SizedBox(height: 32.0),
        BlocConsumer<DiaryBloc, DiaryState>(
          listener: (context, state) {
            if (state is DiaryLoaded) {
              _selectedDiaries = state.diaryEntriesPerDay;
            }
          },
          builder: (context, state) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: _selectedDiaries.isEmpty
                    ? const Center(child: Text('No diary entries for this day'))
                    : ListView.builder(
                        itemCount: _selectedDiaries.length,
                        itemBuilder: (context, index) {
                          return DiaryListItem(_selectedDiaries[index]);
                        },
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
