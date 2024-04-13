import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDate extends StatelessWidget {
  final DateTime date;
  const DiaryDate(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: FittedBox(
        child: Column(
          children: [
            Text(
              date.day.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              DateFormat.E().format(date),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
