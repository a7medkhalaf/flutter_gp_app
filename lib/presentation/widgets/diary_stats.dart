import 'package:flutter/material.dart';

class DiaryStatsCard extends StatelessWidget {
  const DiaryStatsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(32.0),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          mainAxisSpacing: 16,
        ),
        padding: const EdgeInsets.all(8),
        children: const [
          DiaryStatsCardItem(
            title: 'Diary',
            value: '12',
          ),
          DiaryStatsCardItem(
            title: 'Characters',
            value: '812',
          ),
          DiaryStatsCardItem(
            title: 'Start Date',
            value: '2021-09-01',
          ),
          DiaryStatsCardItem(
            title: 'Days',
            value: '1',
          ),
        ],
      ),
    );
  }
}

class DiaryStatsCardItem extends StatelessWidget {
  final String title;
  final String value;
  const DiaryStatsCardItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade900),
        ),
      ],
    );
  }
}
