import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gp_app/presentation/widgets/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 7,
      ),
      duration: const Duration(milliseconds: 250),
    );
  }

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String emojiAsset;
    Color color;
    switch (value.toInt()) {
      case 1:
        emojiAsset = emojiSad;
        color = Colors.blue;
        break;

      case 4:
        emojiAsset = emojiNeutral;
        color = Colors.black;
        break;

      case 7:
        emojiAsset = emojiJoy;
        color = Colors.green;

        break;
      default:
        return Container();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SvgPicture.asset(
        emojiAsset,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 32,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text = Text(
      DateFormat.E().format(
        DateTime.now().subtract(Duration(days: 6 - value.toInt())),
      ),
      style: const TextStyle(fontWeight: FontWeight.bold),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.green.shade300, width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1 => LineChartBarData(
        isCurved: true,
        color: Colors.lightGreen,
        barWidth: 4,
        dotData: const FlDotData(show: false),
        spots: const [
          FlSpot(0, 7),
          FlSpot(1, 1),
          FlSpot(2, 2),
          FlSpot(4, 5),
          FlSpot(6, 4),
        ],
      );
}

class EmotionsLineChart extends StatelessWidget {
  const EmotionsLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            Text(
              'Last 7 days emotions',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 24.0,
                ),
                child: _LineChart(),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
