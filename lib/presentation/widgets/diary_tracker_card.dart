import 'package:flutter/material.dart';

class DiaryTrackerCard extends StatelessWidget {
  const DiaryTrackerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Consecutive reordering days: 1',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: DiaryTrackerWeek(),
            ),
            Text(
              'Maximal reordering days: 3',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}

class DiaryTrackerWeek extends StatelessWidget {
  const DiaryTrackerWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TrackerDay(
          day: DateTime.now().subtract(const Duration(days: 6)).day,
          hasDiary: true,
        ),
        TrackerDay(
          day: DateTime.now().subtract(const Duration(days: 5)).day,
          hasDiary: true,
        ),
        TrackerDay(
          day: DateTime.now().subtract(const Duration(days: 4)).day,
          hasDiary: false,
        ),
        TrackerDay(
          day: DateTime.now().subtract(const Duration(days: 3)).day,
          hasDiary: false,
        ),
        TrackerDay(
          day: DateTime.now().subtract(const Duration(days: 2)).day,
          hasDiary: true,
        ),
        TrackerDay(
          day: DateTime.now().subtract(const Duration(days: 1)).day,
          hasDiary: true,
        ),
        TrackerDay(
          day: DateTime.now().day,
          hasDiary: true,
        ),
      ],
    );
  }
}

class TrackerDay extends StatelessWidget {
  final int day;
  final bool hasDiary;
  const TrackerDay({
    super.key,
    required this.day,
    required this.hasDiary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: hasDiary ? Colors.green.shade300 : Colors.green.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Text(
          day.toString(),
        ),
      ],
    );
  }
}
