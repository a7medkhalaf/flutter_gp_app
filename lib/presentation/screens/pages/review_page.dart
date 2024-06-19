import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gp_app/presentation/widgets/emotions_line_chart.dart';
import 'package:flutter_gp_app/presentation/widgets/diary_stats.dart';
import 'package:flutter_gp_app/presentation/widgets/diary_tracker_card.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          DiaryStatsCard(),
          DiaryTrackerCard(),
          EmotionsLineChart(),
        ],
      ),
    );
  }
}
